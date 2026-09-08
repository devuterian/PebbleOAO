# Marie TUMBLED subsets

Derived from [TsFreddie/TUMBLED v1.3](https://github.com/TsFreddie/TUMBLED/releases/tag/v1.3),
licensed under SIL OFL 1.1 (see LICENSE_OFL).
The original authors credit Fusion Pixel, Galmuri, Unifont and Source Han Sans.

The checked-in MARIE_TUMBLED fonts retain 2,350 Hangul syllables, kana and
punctuation (2,611 glyphs per font). They do not contain all 11,172 Hangul
syllables, standalone Korean jamo, or the full original Chinese set.
All Hangul characters in the Korean system catalog are covered.
Latin text and emoji continue using the firmware's original fonts.

The Lite mappings follow upstream: 14 regular also fills 14 bold; 24 bold
also fills 24 regular; 28 regular also fills 28 bold. The native 18 regular
and bold variants remain separate. TUMBLED has no native 36px variant;
MARIE_TUMBLED_36 scales the 28px regular glyphs with nearest-neighbor sampling
and supplies both 36px slots. Built-in Gothic extensions use these fonts,
including when a previously-installed language pack contains other fonts.

Rebuild with Pillow installed:

```sh
gh release download v1.3 --repo TsFreddie/TUMBLED --pattern '*.pbf' --dir /tmp/tumbled-v1.3
python tools/font/subset_tumbled.py /tmp/tumbled-v1.3 resources/normal/base/fonts/tumbled
```

manifest.json records source and output SHA-256 hashes for each generated font.
The original release files remain unchanged.
