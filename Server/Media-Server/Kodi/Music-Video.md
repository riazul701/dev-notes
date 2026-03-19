# Music-Video.md

# Collection And Presentation

## Summary Of Below Articles

**YouTube music video download**

```shell
yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" --merge-output-format mkv --write-thumbnail --convert-thumbnails jpg --embed-metadata -o "%(title)s.%(ext)s"  YOUTUBE_URL
```

**Kodi Music Videos looks for:**

```text
VideoName.ext
VideoName-thumb.jpg
VideoName.nfo (optional)
```

**Create NFO for each video:**

Example:

```xml
<musicvideo>
  <title>Tum Hi Ho</title>
  <artist>Arijit Singh</artist>
  <artist>Himesh Reshammiya</artist>
  <album>Aashiqui 2</album>
  <year>2013</year>
  <genre>Film Song</genre>
</musicvideo>
```

File name:

```text
Tum Hi Ho.nfo
```

## ChatGPT: "YouTube music video metadata generator for movie music video, where music videos are organized according to movie."

If your music videos are **movie songs (film songs)** and you want them organized by movie in Kodi, normal music-video scrapers (like TheAudioDB) won’t work well 😕

You need a **metadata generator + custom structure** 🎬🎵

---

***## 🏆 BEST METHOD — Treat Them as “Movie Music Videos”***

Organize by movie instead of artist.

***### ✅ Recommended Folder Structure***

```text
Movie Songs/
└── Movie Name (Year)/
    ├── Song Title.ext
    ├── Song Title 2.ext
    └── posters / fanart (optional)
```

Example:

```text
Movie Songs/
└── Dilwale Dulhania Le Jayenge (1995)/
    ├── Tujhe Dekha To.mp4
    └── Mehndi Laga Ke Rakhna.mp4
```

👉 This matches how Kodi expects **movie extras** 🎯

---

***## ⭐ OPTION A — Use Kodi Movie Extras (BEST INTEGRATION)***

Install:

👉 Extras

Place songs inside the movie’s extras folder:

```text
Movies/
└── Movie Name (Year)/
    ├── Movie Name (Year).mkv
    └── extras/
        ├── Song 1.mp4
        └── Song 2.mp4
```

✔ Songs appear inside the movie page
✔ Perfect for Bollywood / Hollywood musical films
✔ No external metadata needed

---

***## ⭐ OPTION B — Use NFO Metadata Generator (Manual but Powerful)***

Create `.nfo` files for each video.

Example:

```xml
<musicvideo>
  <title>Tujhe Dekha To</title>
  <artist>Lata Mangeshkar & Kumar Sanu</artist>
  <album>Dilwale Dulhania Le Jayenge</album>
  <year>1995</year>
  <genre>Film Song</genre>
  <studio>Yash Raj Films</studio>
</musicvideo>
```

File name:

```text
Tujhe Dekha To.nfo
```

Kodi will read this automatically 👍

---

***## ⭐ OPTION C — Semi-Automatic Metadata from YouTube***

Use:

👉 yt-dlp

Download with metadata:

```bash
yt-dlp --write-info-json --write-thumbnail URL
```

This creates:

* video file
* thumbnail
* JSON metadata

You can convert JSON → NFO with scripts 🤖

---

***## ⭐ OPTION D — Use MediaElch for Local NFO Creation***

👉 MediaElch

Add the folder as **Music Videos** → edit metadata manually → save NFO.

Good for curated collections 👍

---

***## 🔥 BEST PRACTICE (Most Kodi Users Prefer)***

***### ✔ For songs belonging to specific movies:***

➡️ Use **Movie Extras** (Option A)

***### ✔ For standalone song library:***

➡️ Use Music Videos + NFO (Option B)

---

***## 🚫 Why Regular Music Video Scrapers Fail***

Film songs often have:

❌ Multiple artists
❌ Different titles on YouTube
❌ No database entries
❌ Regional cinema (Bollywood, Tollywood, etc.)

---

***## 🧠 Ultimate Cinema-Style Setup (Recommended)***

```text
Movies/
└── Movie Name (Year)/
    ├── Movie.mkv
    └── extras/
        └── Songs/
            ├── Song 1.mp4
            └── Song 2.mp4
```

Looks AMAZING in Kodi skins 🎬✨

---

If you want, I can also show:

✅ Fully automatic YouTube → Kodi movie-song pipeline
✅ Best setup for Bollywood / Indian film songs 🇮🇳
✅ How to scrape songs with posters & thumbnails
✅ Build a “Netflix-style” movie song library
✅ Setup without NFO files

Just tell me 😎

## ChatGPT: "Organize music videos into movie name and download highest quality upto 1080p by yt-dlp"

Perfect 👍 You want:

✅ Appear ONLY in **Music Videos** section of Kodi
✅ Organized **movie-wise (by film name)** 🎬
✅ Download from YouTube using yt-dlp
✅ Highest quality **up to 1080p (not 4K)** 📺
✅ Clean metadata 🎵

Here is the **correct pro setup** 👇

---

# 🏆 BEST STRUCTURE — Movie-Wise Music Videos Library

Kodi Music Videos supports folders, so we use:

```text
Music Videos/
└── Movie Name (Year)/
    ├── Song Title 1.mkv
    ├── Song Title 2.mkv
```

Example:

```text
Music Videos/
└── Aashiqui 2 (2013)/
    ├── Tum Hi Ho.mkv
    └── Sunn Raha Hai.mkv
```

👉 Movie acts like an “album” 🎯
👉 Songs grouped automatically

---

# ✅ yt-dlp Command — 1080p MAX + Movie Folder

Use this ⭐

```bash
yt-dlp ^
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
--merge-output-format mkv ^
--write-thumbnail --convert-thumbnails jpg ^
--embed-metadata ^
-o "D:\Music Videos\%(album)s (%(release_year)s)\%(title)s.%(ext)s" ^
YOUTUBE_URL
```

---

## 🔥 What This Command Does

✔ Limits video to **≤1080p**
✔ Downloads best audio
✔ Merges into MKV
✔ Uses movie name (album) as folder
✔ Embeds metadata
✔ Downloads thumbnail

---

## 📁 Result Example

```text
Music Videos/
└── Aashiqui 2 (2013)/
    ├── Tum Hi Ho.mkv
    └── Sunn Raha Hai.mkv
```

---

# ⚠️ IMPORTANT — YouTube Metadata Issue

Many uploads do NOT provide album/movie info 😬
So folder may become:

```text
Unknown Album (NA)
```

---

# ⭐ GUARANTEED METHOD (Manual Movie Name)

Force folder name yourself 👇

```bash
yt-dlp ^
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
--merge-output-format mkv ^
--write-thumbnail --convert-thumbnails jpg ^
--embed-metadata ^
-o "D:\Music Videos\Aashiqui 2 (2013)\%(title)s.%(ext)s" ^
YOUTUBE_URL
```

👉 100% reliable 🎯

---

# ✅ OPTIONAL — Perfect Kodi Metadata (NFO)

Create NFO for each video:

Example:

```xml
<musicvideo>
  <title>Tum Hi Ho</title>
  <artist>Arijit Singh</artist>
  <album>Aashiqui 2</album>
  <year>2013</year>
  <genre>Film Song</genre>
</musicvideo>
```

File name:

```text
Tum Hi Ho.nfo
```

Kodi reads this perfectly 👍

---

# ✅ Add to Kodi Correctly

In Kodi:

Videos → Files → Add Videos

Select:

```
D:\Music Videos
```

Set:

✔ Content = 🎵 **Music Videos**
✔ Scraper = Local information only

Scan 🔄

---

# 🎬 FINAL RESULT

Kodi → 🎤 Music Videos

You can browse by:

✔ Movie (Album)
✔ Artist
✔ Title
✔ Year
✔ Genre

---

# 🏆 BEST PRACTICE SUMMARY

✔ Use movie folders
✔ Limit to 1080p for compatibility
✔ Clean filenames
✔ Optional NFO for perfection
✔ Add as Music Videos (not Movies)

---

If you want, I can also give you:

🔥 ONE-CLICK Windows script (paste links → auto organize by movie)
🔥 Automatic movie-name detection from YouTube titles 🤖
🔥 Best setup for Bangla / Bollywood film songs 🇧🇩🇮🇳
🔥 Auto artwork downloader
🔥 Remote-friendly TV interface

Just say 😎

## ChatGPT: "Kodi does not using downloaded thumbnail of yt-dlp"

Yes — this is a very common issue 👍
Kodi usually **does NOT use thumbnails downloaded by yt-dlp automatically** ❌

Because Kodi expects very specific artwork names and metadata rules 🎯

---

***# 🧠 Why Kodi Ignores yt-dlp Thumbnails***

yt-dlp saves thumbnails like:

```
Song Title.webp
Song Title.jpg
Song Title.png
```

But Kodi Music Videos expects:

👉 `-thumb.jpg` naming
👉 OR artwork defined in NFO
👉 OR scraper-provided images

---

***# 🏆 FIX — Rename Thumbnail Correctly***

***## ✅ Required Naming for Music Videos***

Thumbnail file MUST match video name:

```
Video Name.ext
Video Name-thumb.jpg   ← REQUIRED
```

---

***## 📁 Example***

```
Tum Hi Ho.mkv
Tum Hi Ho-thumb.jpg
```

Now Kodi will use it 👍

---

***# ⭐ yt-dlp Command That Works with Kodi***

Use this instead 👇

```bash
yt-dlp ^
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
--merge-output-format mkv ^
--write-thumbnail --convert-thumbnails jpg ^
-o "D:\Music Videos\%(album)s (%(release_year)s)\%(title)s.%(ext)s" ^
URL
```

After download, rename:

```
%(title)s.jpg → %(title)s-thumb.jpg
```

---

***# 🚀 FULL AUTOMATIC SOLUTION (Windows)***

***## PowerShell — Rename All Thumbnails***

Run inside your Music Videos folder:

```powershell
Get-ChildItem -Recurse -Filter *.jpg |
Where-Object { $_.Name -notmatch "-thumb\.jpg$" } |
Rename-Item -NewName { $_.BaseName + "-thumb.jpg" }
```

✔ Works for entire library
✔ Instant fix ⚡

---

***# ⭐ EVEN BETTER — Use NFO File***

Kodi will ALWAYS respect artwork defined in NFO.

Example:

```xml
<musicvideo>
  <title>Tum Hi Ho</title>
  <artist>Arijit Singh</artist>
  <thumb>Tum Hi Ho-thumb.jpg</thumb>
</musicvideo>
```

---

***# ⚠️ Important Kodi Rules for Music Video Artwork***

Kodi looks for (in priority order):

1️⃣ Artwork specified in NFO
2️⃣ `VideoName-thumb.jpg`
3️⃣ Scraper images
4️⃣ Nothing → blank

---

***# 🔴 Also Check These***

***## ❌ Wrong content type***

Make sure source is:

👉 Content = **Music Videos** 🎵
NOT Movies or TV Shows

---

***## ❌ Library cache not refreshed***

After adding artwork:

➡️ Update library
➡️ Clean library
➡️ Restart Kodi

---

***# 🏆 BEST PRACTICE (Recommended)***

For each video:

```
Song.mkv
Song-thumb.jpg
Song.nfo   (optional)
```

👉 100% reliable 🎯

---

***# 🚀 If You Want Ultimate Automation***

I can also provide:

🔥 yt-dlp command that auto-generates Kodi-ready artwork
🔥 Script to create NFO files automatically
🔥 Setup for movie-wise music video library 🎬
🔥 Poster + fanart support for music videos
🔥 Perfect setup for Bangla / Bollywood songs 🇧🇩🇮🇳

Just say 😎

## ChatGPT: "yt-dlp command that AUTO-generates Kodi-ready artwork"

Perfect 👍 — here is the **yt-dlp command that AUTO-generates Kodi-ready artwork** for Music Videos in Kodi 🎬🎵
(no manual renaming needed ❌)

Uses yt-dlp + automatic post-processing ✅

---

***# 🏆 ONE-COMMAND: Download + Kodi Artwork Ready***

***## ✅ Windows Command (CMD)***

```bat
yt-dlp ^
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
--merge-output-format mkv ^
--write-thumbnail --convert-thumbnails jpg ^
--embed-metadata ^
--exec "after_move:cmd /c ren \"{}\" \"%(title)s.%(ext)s\" & ren \"%(title)s.jpg\" \"%(title)s-thumb.jpg\"" ^
-o "D:\Music Videos\%(album)s (%(release_year)s)\%(title)s.%(ext)s" ^
YOUTUBE_URL
```

---

***# 🔥 What This Does Automatically***

✔ Downloads highest quality ≤1080p
✔ Saves video as MKV
✔ Downloads thumbnail
✔ Converts thumbnail to JPG
✔ Renames thumbnail to Kodi format
✔ Organizes by movie (album)
✔ Embeds metadata

---

***# 📁 Final Result (Perfect for Kodi)***

```text
Music Videos/
└── Movie Name (Year)/
    ├── Song Title.mkv
    └── Song Title-thumb.jpg
```

👉 Appears instantly in 🎤 **Music Videos section**

---

***# ⭐ EVEN BETTER — Add Auto NFO Generation***

Kodi works BEST with NFO.

***## 🔥 Advanced Command (Artwork + NFO)***

```bat
yt-dlp ^
-f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
--merge-output-format mkv ^
--write-thumbnail --convert-thumbnails jpg ^
--embed-metadata ^
--write-info-json ^
--exec "after_move:cmd /c ren \"%(title)s.jpg\" \"%(title)s-thumb.jpg\"" ^
-o "D:\Music Videos\%(album)s (%(release_year)s)\%(title)s.%(ext)s" ^
YOUTUBE_URL
```

Then you can convert JSON → NFO automatically (optional step).

---

***# 🧠 Why This Works***

Kodi Music Videos looks for:

```
VideoName.ext
VideoName-thumb.jpg
VideoName.nfo (optional)
```

yt-dlp normally does NOT follow this ❌
This command fixes everything 🎯

---

***# ⚠️ If Movie Name Is Missing***

YouTube metadata is often messy 😬

Force movie folder manually:

```bat
-o "D:\Music Videos\My Movie (2023)\%(title)s.%(ext)s"
```

---

***# 🚀 BEST POSSIBLE SETUP (Recommended)***

✔ Limit to 1080p for compatibility
✔ MKV container
✔ Movie-wise folders
✔ Kodi-ready thumbnails
✔ Offline library ready

---

***# 😎 Want FULL AUTOMATION?***

I can also give you:

🔥 ONE-CLICK script (paste links → done)
🔥 Auto movie-name detection from title 🤖
🔥 Auto NFO generator for perfect metadata
🔥 Setup optimized for Bangla / Bollywood songs 🇧🇩🇮🇳
🔥 Netflix-style Kodi music video library
🔥 Ultra-low CPU playback settings

Just say what level you want 👌

