#!/usr/bin/env python3
"""Add the KS X 1001 special-character rows without replacing existing glyphs."""
import argparse
import hashlib
import json
from pathlib import Path
from PIL import Image, ImageChops, ImageDraw, ImageFont
from fontTools.ttLib import TTFont


# Common misspellings and playful Korean internet spellings that fall outside
# the 2,350 KS X 1001 Hangul syllables kept in the compact system font.
INTERNET_WORDS = (
    "봣 쫒 샒 뷁 됫 됏 댓 됬 햏자 늅 띵작 댕댕이 커엽 킹받네 "
    "엌 앜 읔 읭 뀨 뀽 꺄 꺅 꺆 꺜 쀍 쀽 솩 쌉쩔어 흠좀무 "
    "존맛탱 꿀잼 노잼 핵잼 갬성 오졌 지렸 킹정 뇌절 어쩔티비 "
    "갑분싸 개이득 띠용 뿜뿜 헿 훔냐 냠냠 녜 뉑 뫄 뭥 므엥 "
    "웅앵웅 끵 뀰 뽀짝 뽀쟉 긔엽긔 않됌 하쉴 아뉘 웬열 왤케 "
    "쟈 쟝 쥰내 쒸익 쓱싹 뿌앵 끼얏호우 먄 냬"
)


def internet_syllable_codepoints():
    return sorted({ord(char) for char in INTERNET_WORDS if 0xAC00 <= ord(char) <= 0xD7A3})


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


def add_internet_syllables(glyphs, source, font_size, bold=False):
    font = ImageFont.truetype(str(source), font_size)
    cmap = TTFont(source).getBestCmap()
    _, target_h, _, target_y, _, _ = glyphs[ord("한")]
    ref = font.getbbox("한", anchor="ls")
    scale = target_h / (ref[3] - ref[1])
    added = []
    for cp in internet_syllable_codepoints():
        if cp in glyphs:
            continue
        if cp not in cmap:
            raise ValueError(f"Missing source glyph U+{cp:04X}")
        box = font.getbbox(chr(cp), anchor="ls")
        w, h = box[2] - box[0], box[3] - box[1]
        advance = max(1, round(font.getlength(chr(cp)) * scale))
        im = Image.new("L", (w, h))
        ImageDraw.Draw(im).text((-box[0], -box[1]), chr(cp), font=font, fill=255, anchor="ls")
        im = im.resize(
            (max(1, round(w * scale)), max(1, round(h * scale))),
            Image.Resampling.NEAREST if "Galmuri" in source.name else Image.Resampling.BOX,
        ).point(lambda pixel: 255 if pixel else 0)
        if bold:
            original = Image.new("L", (im.width + 1, im.height))
            shifted = Image.new("L", (im.width + 1, im.height))
            original.paste(im, (0, 0))
            shifted.paste(im, (1, 0))
            im = ImageChops.lighter(original, shifted)
        w, h = im.size
        left = round(box[0] * scale)
        top = target_y + round((box[1] - ref[1]) * scale)
        glyphs[cp] = (
            w,
            h,
            left,
            top,
            max(advance, left + w),
            [int(bool(pixel)) for pixel in im.getdata()],
        )
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
