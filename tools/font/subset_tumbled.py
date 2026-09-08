#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 PebbleOS contributors
# SPDX-License-Identifier: Apache-2.0

"""Subset TUMBLED v1.3 release PBFs for the Time 2 resource bank.

Keep Korean, kana and punctuation, preserving original pixels at native sizes.
The 36px fallback scales the 28px glyphs with nearest-neighbor sampling.
Usage: python tools/font/subset_tumbled.py SOURCE_DIR OUTPUT_DIR
"""

import argparse
import hashlib
import json
import struct
from pathlib import Path

from PIL import Image, ImageChops, ImageDraw, ImageFont


def read_font(path):
    data = path.read_bytes()
    version, height, count, wildcard, buckets, cp_size, header_size, flags = struct.unpack_from(
        "<BBHHBBBB", data
    )
    assert version == 3 and header_size == 10
    entry_fmt = "<" + ("H" if cp_size == 2 else "I") + ("H" if flags & 1 else "I")
    entry_size = struct.calcsize(entry_fmt)
    offsets_start = header_size + buckets * 4
    glyph_start = offsets_start + count * entry_size
    glyphs = {}
    for bucket in range(buckets):
        _, size, offset = struct.unpack_from("<BBH", data, header_size + bucket * 4)
        for index in range(size):
            cp, offset_glyph = struct.unpack_from(
                entry_fmt, data, offsets_start + offset + index * entry_size
            )
            if not (cp < 0x3400 or 0xAC00 <= cp <= 0xD7A3):
                continue
            start = glyph_start + offset_glyph
            width, rows, left, top, advance = struct.unpack_from("<BBbbb", data, start)
            bitmap = data[start + 5:]
            bits = []
            if flags & 2:
                for unit in range(rows):
                    nibble = (bitmap[unit // 2] >> ((unit % 2) * 4)) & 15
                    bits.extend([nibble >> 3] * ((nibble & 7) + 1))
                rows = len(bits) // width if width else 0
            else:
                bits = [(bitmap[i // 8] >> (i % 8)) & 1 for i in range(width * rows)]
            glyphs[cp] = (width, rows, left, top, advance, bits[:width * rows])
    return height, wildcard, glyphs


def write_font(path, source_height, height, wildcard, glyphs):
    tables = [[] for _ in range(255)]
    glyph_data = bytearray()
    for cp, (width, rows, left, top, advance, bits) in sorted(glyphs.items()):
        if height != source_height:
            scale = height / source_height
            if width and rows:
                img = Image.new("L", (width, rows))
                img.putdata(bits)
                width, rows = round(width * scale), round(rows * scale)
                img = img.resize((width, rows), Image.Resampling.NEAREST)
                bits = list(img.getdata())
            left, top, advance = [round(value * scale) for value in (left, top, advance)]
        tables[cp % 255].append((cp, len(glyph_data)))
        glyph_data.extend(struct.pack("<BBbbb", width, rows, left, top, advance))
        bitmap = bytearray(((len(bits) + 31) // 32) * 4)
        for i, bit in enumerate(bits):
            bitmap[i // 8] |= bit << (i % 8)
        glyph_data.extend(bitmap)
    data = bytearray(struct.pack("<BBHHBBBB", 3, height, len(glyphs), wildcard, 255, 2, 10, 0))
    offset = 0
    for bucket, entries in enumerate(tables):
        assert len(entries) <= 127
        data.extend(struct.pack("<BBH", bucket, len(entries), offset))
        offset += len(entries) * 6
    for entries in tables:
        for cp, offset in entries:
            data.extend(struct.pack("<HI", cp, offset))
    path.write_bytes(data + glyph_data)


def add_jamo(glyphs, height, suffix, source):
    """Fill TUMBLED's missing compatibility jamo from its Korean font family."""
    font_size = 12 if height == 14 else 15
    font = ImageFont.truetype(str(source), font_size)

    def raster(char):
        canvas = Image.new("1", (font_size * 2, font_size * 2))
        ImageDraw.Draw(canvas).text((0, 0), char, font=font, fill=1)
        return canvas, canvas.getbbox()

    _, reference = raster("한")
    target_width, target_rows, target_left, target_top, advance, _ = glyphs[ord("한")]
    scale = target_rows / (reference[3] - reference[1])
    for cp in range(0x3131, 0x318F):
        canvas, bbox = raster(chr(cp))
        if bbox is None:  # Hangul filler U+3164 is intentionally blank.
            assert cp == 0x3164
            glyphs[cp] = (0, 0, 0, 0, advance, [])
            continue
        glyph = canvas.crop(bbox)
        width, rows = [round(value * scale) for value in glyph.size]
        glyph = glyph.resize((width, rows), Image.Resampling.NEAREST)
        if suffix == "_BOLD":
            original = Image.new("1", (width + 1, rows))
            shifted = Image.new("1", (width + 1, rows))
            original.paste(glyph, (0, 0))
            shifted.paste(glyph, (1, 0))
            glyph = ImageChops.lighter(original, shifted)
            width += 1
        left = target_left + max(0, (target_width - width) // 2)
        top = target_top + round((bbox[1] - reference[1]) * scale)
        glyphs[cp] = (width, rows, left, top, max(advance, left + width),
                      [int(bool(pixel)) for pixel in glyph.getdata()])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("source", type=Path)
    parser.add_argument("output", type=Path)
    parser.add_argument("--jamo-source", type=Path, required=True,
                        help="Directory containing Galmuri11.ttf and Galmuri14.ttf")
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    records = []
    variants = ((14, ""), (18, ""), (18, "_BOLD"), (24, "_BOLD"), (28, ""), (36, ""))
    for height, suffix in variants:
        source = args.source / f"TUMBLED_{min(height, 28)}{suffix}.pbf"
        original_height, wildcard, glyphs = read_font(source)
        jamo_source = args.jamo_source / f"Galmuri{11 if height == 14 else 14}.ttf"
        add_jamo(glyphs, min(height, 28), suffix, jamo_source)
        output = args.output / f"MARIE_TUMBLED_{height}{suffix}.pbf"
        write_font(output, original_height, height, wildcard, glyphs)
        records.append({
            "file": output.name,
            "source": source.name,
            "source_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
            "jamo_source": jamo_source.name,
            "jamo_source_sha256": hashlib.sha256(jamo_source.read_bytes()).hexdigest(),
            "sha256": hashlib.sha256(output.read_bytes()).hexdigest(),
            "glyphs": len(glyphs),
            "bytes": output.stat().st_size,
        })
    (args.output / "manifest.json").write_text(json.dumps(records, indent=2) + "\n")
    print(f"Generated {len(records)} fonts: {sum(r['bytes'] for r in records)} bytes")


if __name__ == "__main__":
    main()
