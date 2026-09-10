# Marie TUMBLED subsets

Derived from [TsFreddie/TUMBLED v1.3](https://github.com/TsFreddie/TUMBLED/releases/tag/v1.3),
licensed under SIL OFL 1.1 (see LICENSE_OFL).
The original authors credit Fusion Pixel, Galmuri, Unifont and Source Han Sans.

The checked-in MARIE_TUMBLED fonts retain 2,350 Hangul syllables, kana and
punctuation, plus 94 compatibility jamo U+3131–U+318E (3,412 glyphs per font after the symbol additions).
They do not contain all 11,172 Hangul syllables or the full original Chinese set.
All Hangul characters in the Korean system catalog are covered.
Latin text and emoji continue using the firmware's original fonts.

At 14/18/24px, compatibility jamo (including ㄱ, ㅋ, ㅎ, ㅏ, ㅠ and compound jamo)
are rasterized from Galmuri11/Galmuri14, a source family already used by TUMBLED
for Korean. At 28/36px they use Source Han Sans K Regular instead.
TUMBLED syllables remain unchanged. Their size and baseline follow the corresponding TUMBLED Hangul.
Galmuri copyright belongs to Lee Minseo; see LICENSE_GALMURI (SIL OFL 1.1).
This adds standalone compatibility characters, not decomposed-syllable shaping.

The Lite mappings follow upstream: 14 regular also fills 14 bold; 24 bold
also fills 24 regular; 28 regular also fills 28 bold. The native 18 regular
and bold variants remain separate. TUMBLED has no native 36px variant;
MARIE_TUMBLED_36 scales the 28px regular glyphs with nearest-neighbor sampling
and supplies both 36px slots. Built-in Gothic extensions use these fonts,
including when a previously-installed language pack contains other fonts.

The KS X 1001 special-character rows (A1–AC) and U+25EF are now covered.
707 missing characters are added to each font. For 28/36px, Source Han Sans K
Regular supplies these glyphs, with Galmuri11 as fallback; smaller sizes use
Galmuri11. The 28/36px compatibility jamo U+3131–U+318E also use Source Han Sans K
Regular, including repeated letters (ㅋㅋ, ㅎㅎ, ㅠㅠ) and double consonants.
Other existing glyph ink positions and advances are unchanged. Transparent
margins and duplicate glyph data are removed; the existing PBF RLE format is used
only where smaller. This does not add a new runtime compression scheme.
Source Han Sans is Copyright 2014–2025 Adobe, licensed under SIL OFL 1.1;
see LICENSE_SOURCE_HAN_SANS. Galmuri v2.40.4 uses the same license.

Rebuild with Pillow and fontTools installed:

```sh
gh release download v1.3 --repo TsFreddie/TUMBLED --pattern '*.pbf' --dir /tmp/tumbled-v1.3
git clone https://github.com/devuterian/pebble-korean-language-pack /tmp/pebble-korean-language-pack
python tools/font/subset_tumbled.py /tmp/tumbled-v1.3 resources/normal/base/fonts/tumbled \
  --jamo-source /tmp/pebble-korean-language-pack/source/ttf/Galmuri \
  --large-symbol-source /path/to/SourceHanSansK-Regular.otf
```

manifest.json records TUMBLED, Galmuri source, and output SHA-256 hashes.
The original release files remain unchanged.
