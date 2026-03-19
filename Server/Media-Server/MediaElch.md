# Usage

## Important

* On "Left Side Menu" -> "Movies" -> "Settings" -> "Movies", remove `<baseFileName>-` from `Poster, Backdrop, Logo, Clear Art, Disc Art, Banner, Thumb`. Keep `Nfo` same as original. This is required to find video files easily on `VLC` player. Many `.mkv` files are not supported on `Kodi`, because of `Codec` absence.

# MediaElch.md

## Naming Format For Scraping

**Movie**

* Folder Name Format For Scraping: `<Movie-Name> (<Release-Year>)`
* File (Inside Folder) Name Format For Scraping: `<Movie-Name> (<Release-Year>).Extension`

```text
Movies/
└── Movie Name (Year)/
    └── Movie Name (Year).Extension
```

**TV-Shows/TV-Series**

```text
TV Shows/
└── Show Name (Year)/
    ├── Season 01/
    │   ├── Show Name S01E01.ext
    │   ├── Show Name S01E02.ext
    │   └── ...
    ├── Season 02/
    │   ├── Show Name S02E01.ext
    │   └── ...
    └── tvshow.nfo   (optional, created by MediaElch)
```

# References

## Websites

* [mediaelch.github.io/mediaelch-doc](https://mediaelch.github.io/mediaelch-doc/)

## YouTube Tutorials

* [XBMC HOW TO: Prepare Movies with MediaElch BY xoxoHarls](https://www.youtube.com/watch?v=KQ5hSNAY-qA)
