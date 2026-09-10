#!/usr/bin/env python3
"""Add the KS X 1001 special-character rows without replacing existing glyphs."""
import argparse
import hashlib
import json
from pathlib import Path
from PIL import Image, ImageDraw, ImageFont
from fontTools.ttLib import TTFont


def codepoints():
    result = {0x25EF}  # Large circle, visually similar to the KS X 1001 white circle.
    for row in range(0xA1, 0xAD):
        for col in range(0xA1, 0xFF):
            try:
                result.add(ord(bytes([row, col]).decode('euc_kr')))
            except UnicodeDecodeError:
                pass
    return sorted(result)


def add_symbols(glyphs, source, fallback=None):
    cmap = TTFont(source).getBestCmap()
    fallback_cmap = TTFont(fallback).getBestCmap() if fallback else {}
    fonts = [ImageFont.truetype(str(source), 32 if fallback else 16)]
    if fallback:
        fonts.append(ImageFont.truetype(str(fallback), 16))
    _, target_h, _, target_y, _, _ = glyphs[ord('한')]
    added = []
    for cp in codepoints():
        if cp in glyphs:
            continue
        if cp not in cmap and cp not in fallback_cmap:
            raise ValueError(f"Missing source glyph U+{cp:04X}")
        font = fonts[0] if cp in cmap else fonts[1]
        ref = font.getbbox("한", anchor="ls")
        scale = target_h / (ref[3] - ref[1])
        box = font.getbbox(chr(cp), anchor='ls')
        w, h = box[2] - box[0], box[3] - box[1]
        advance = max(1, round(font.getlength(chr(cp)) * scale))
        if not w or not h:
            glyphs[cp] = (0, 0, 0, 0, advance, [])
        else:
            im = Image.new('L', (w, h))
            ImageDraw.Draw(im).text((-box[0], -box[1]), chr(cp), font=font, fill=255, anchor='ls')
            im = im.resize((max(1, round(w * scale)), max(1, round(h * scale))),
                           Image.Resampling.BOX).point(lambda p: 255 if p else 0)
            w, h = im.size
            left = round(box[0] * scale)
            top = target_y + round((box[1] - ref[1]) * scale)
            glyphs[cp] = (w, h, left, top, max(advance, left + w),
                          [int(bool(x)) for x in im.getdata()])
        added.append(cp)
    return added


def main():
    from subset_tumbled import read_font, write_font
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=Path)
    parser.add_argument('--source', type=Path, required=True)
    args = parser.parse_args()
    records = []
    for path in sorted(args.directory.glob('*.pbf')):
        height, wildcard, glyphs = read_font(path)
        if ord('한') not in glyphs:
            continue
        added = add_symbols(glyphs, args.source)
        write_font(path, height, height, wildcard, glyphs)
        records.append(dict(file=path.name, added=[f'U+{cp:04X}' for cp in added],
                            glyphs=len(glyphs), bytes=path.stat().st_size,
                            sha256=hashlib.sha256(path.read_bytes()).hexdigest()))
    report = dict(source=args.source.name,
                  source_sha256=hashlib.sha256(args.source.read_bytes()).hexdigest(),
                  codepoints=[f'U+{cp:04X}' for cp in codepoints()], fonts=records)
    (args.directory/'symbols-manifest.json').write_text(json.dumps(report, indent=2)+'\n')
    print([(x['file'], len(x['added']), x['bytes']) for x in records])


if __name__ == '__main__':
    main()
