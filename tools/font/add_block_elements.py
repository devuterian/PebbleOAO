#!/usr/bin/env python3
# SPDX-FileCopyrightText: 2026 PebbleOS contributors
# SPDX-License-Identifier: Apache-2.0

"""Draw the Block Elements (U+2580-U+259F) pixel by pixel into the TUMBLED fonts.

Shades use ordered dither patterns so text progress bars such as ▓▓▓░░░ stay
readable on 1-bit screens. Cells are half-width and span the Hangul line box.
Existing glyphs are kept, so U+2592 from the KS X 1001 rows stays unchanged.
Usage: python tools/font/add_block_elements.py resources/normal/base/fonts/tumbled
"""

import argparse
import hashlib
import json
from pathlib import Path

from subset_tumbled import read_font, write_font

FIRST, LAST = 0x2580, 0x259F


def _shade(x, y, cp):
    if cp == 0x2591:  # light shade, 25%
        return x % 2 == 0 and y % 2 == 0
    if cp == 0x2592:  # medium shade, 50%
        return (x + y) % 2 == 0
    return not (x % 2 == 1 and y % 2 == 1)  # dark shade, 75%


def _quadrants(cp):
    # Upper left, upper right, lower left, lower right.
    return {
        0x2596: (0, 0, 1, 0), 0x2597: (0, 0, 0, 1), 0x2598: (1, 0, 0, 0),
        0x2599: (1, 0, 1, 1), 0x259A: (1, 0, 0, 1), 0x259B: (1, 1, 1, 0),
        0x259C: (1, 1, 0, 1), 0x259D: (0, 1, 0, 0), 0x259E: (0, 1, 1, 0),
        0x259F: (0, 1, 1, 1),
    }[cp]


def block_pixel(cp, x, y, w, h):
    if cp == 0x2580:  # upper half
        return y < h // 2
    if 0x2581 <= cp <= 0x2588:  # lower eighths up to the full block
        return y >= h - round(h * (cp - 0x2580) / 8)
    if 0x2589 <= cp <= 0x258F:  # left seven eighths down to one eighth
        return x < max(1, round(w * (0x2590 - cp) / 8))
    if cp == 0x2590:  # right half
        return x >= w // 2
    if 0x2591 <= cp <= 0x2593:
        return _shade(x, y, cp)
    if cp == 0x2594:  # upper eighth
        return y < max(1, round(h / 8))
    if cp == 0x2595:  # right eighth
        return x >= w - max(1, round(w / 8))
    ul, ur, ll, lr = _quadrants(cp)
    top, left = y < h // 2, x < w // 2
    return bool((ul if left else ur) if top else (ll if left else lr))


def add_blocks(glyphs):
    # Span the Hangul line box: from the top of 한 to the bottom of the descender of 가.
    _, han_h, _, han_top, _, _ = glyphs[ord('한')]
    w = max(2, round(han_h / 2))
    if w % 2:
        w += 1
    h = han_h
    added = []
    for cp in range(FIRST, LAST + 1):
        if cp in glyphs:
            continue
        bits = [int(block_pixel(cp, x, y, w, h)) for y in range(h) for x in range(w)]
        glyphs[cp] = (w, h, 0, han_top, w, bits)
        added.append(cp)
    return added


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('directory', type=Path)
    args = parser.parse_args()
    manifest_path = args.directory / 'manifest.json'
    manifest = json.loads(manifest_path.read_text())
    by_file = {entry['file']: entry for entry in manifest}
    for path in sorted(args.directory.glob('MARIE_TUMBLED_*.pbf')):
        height, wildcard, glyphs = read_font(path)
        added = add_blocks(glyphs)
        if not added:
            continue
        write_font(path, height, height, wildcard, glyphs)
        entry = by_file[path.name]
        entry['added_block_elements'] = [f'U+{cp:04X}' for cp in added]
        entry['sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
        print(path.name, len(added), path.stat().st_size)
    manifest_path.write_text(json.dumps(manifest, indent=2, ensure_ascii=False) + '\n')


if __name__ == '__main__':
    main()
