# Navidrome.md

## PATH

* Navidrome Config Location: `C:\Program Files\Navidrome`

## Notes

* Important: Allow Navidrome From Windows Firewall To Connect From LAN/Tailscale.

* Important: Disable Battery Optimization To Play Music When Screen Is Off. This Is Applicable For All Music Player.

* Navidrome Uses/Implements “Subsonic” API.

* After configuration changes, restart server from services.

* Navidrome URL: `http://localhost:4533/` 

* How to comment lines
  * You can use either of these at the start of a line:
    * `;` (INI-style, most common)
    * `#` (also supported)
    * Both work the same.

* Workarounds for Android TV Playback
  * Kodi + Subsonic Addon: Install Kodi on Android TV and then the Subsonic plugin to stream from your Navidrome server. This gives a more TV-friendly UI and remote navigation.

## Local Audio Players

**Strawberry (Windows, Linux - Local) {Selected}**

* [strawberrymusicplayer.org](https://www.strawberrymusicplayer.org/)
* [strawberrymusicplayer/strawberry GitHub](https://github.com/strawberrymusicplayer/strawberry)

* Fork of Clementine music player.
* Get dark/light theme from operating system's installed theme. Windows and Linux OS works.
* Windows version is paid. Install from chocolatey package manager.

**Clementine (Computer - Local)**

* [clementine-player.org](https://www.clementine-player.org/)
* [clementine-player/Clementine GitHub](https://github.com/clementine-player/Clementine)

**AIMP (Android - Local/SMB) {Selected}**

* [aimp.ru](https://aimp.ru/)
* [AIMP BY Artem Izmaylov](https://play.google.com/store/apps/details?id=com.aimp.player)

* Android ".apk" size 6.6 MB

**Samba Network Music Player (Android - SMB)**

* [Samba Network Music Player BY 3Cats Software](https://play.google.com/store/apps/details?id=com.threecats.sambaplayer)
* [reddit.com/r/SambaPlayer](https://www.reddit.com/r/SambaPlayer/)

## Navidrome Clients

**Supersonic (Windows, Linux - Navidrome) {Selected}**

* [dweymouth/supersonic GitHub => Windows, Linux](https://github.com/dweymouth/supersonic)

**Tempus (Android Mobile - Navidrome) {Selected}**

* [eddyizm/tempus GitHub](https://github.com/eddyizm/tempus)
  * Fork of [CappielloAntonio/tempo GitHub](https://github.com/CappielloAntonio/tempo)

* Can add multiple Navidrome sources - LAN and Tailscale
* Direct APK, No Google Play Store
* Supports internet radio
* Lightweight android ".apk", size 7.61 MB

**Chora (Android TV - Navidrome) {Selected}**

* [CraftWorksMC/Chora GitHub](https://github.com/CraftWorksMC/Chora)
* [Chora BY CraftWorks => Google Play Store](https://play.google.com/store/apps/details?id=com.craftworks.music)

* Can add multiple Navidrome sources - LAN and Tailscale
* Lightweight android ".apk", 4.05 MB

**Musly (Windows, Linux, Android Mobile - Navidrome)**

* [musly.devid.ink](https://musly.devid.ink/) || [dddevid/Musly GitHub](https://github.com/dddevid/Musly)

* Can add a single source. Source can be Navidrome or phone memory’s “Music” folder.
* Direct APK, No Google Play Store.

* Connection:
  * Domain: `http://{{IP-Address}}:4533`
  * User Name: {{user-name}}
  * Password: {{password}}

* Android ".apk" size 56.1 MB

**Amcfy (Android Mobile - Navidrome)**

* [amcfy.com](https://www.amcfy.com/)
* [amcfy-music/amcfy-music GitHub](https://github.com/amcfy-music/amcfy-music)
* [Amcfy Music - Subsonic Client BY Amcfy Inc.](https://play.google.com/store/apps/details?id=com.sumsg.musichub)

* Can add multiple Navidrome sources - LAN and Tailscale
* Android ".apk" size 16 MB

**DSub2000 (Android Mobile - Navidrome)**

* [paroj/DSub2000 GitHub](<https://github.com/paroj/DSub2000>)

* Can add multiple Navidrome sources - LAN and Tailscale
* If domain is “http\://”, then enable/check “Allow insecure connections \[Allow http traffic and ignore warnings and errors with https connections (not recommended)]”

**Ultrasonic (Android Mobile - Navidrome)**

* \[Ultrasonic/Ultrasonic GitLab]\(<https://gitlab.com/ultrasonic/ultrasonic>) 
* \[Ultrasonic BY Moire]\(<https://play.google.com/store/apps/details?id=org.moire.ultrasonic>) 

* Can add multiple Navidrome sources - LAN and Tailscale
* Does not support internet radio.
* Android ".apk" size 4.7 MB

**SubStreamer (Android Mobile - Navidrome)**

* [substreamerapp.com](<https://substreamerapp.com/>)
* [substreamer - Subsonic Client BY Gaven Henry](<https://play.google.com/store/apps/details?id=com.ghenry22.substream2>)

* Can add a single Navidrome source.

**Navic (Android Mobile - Navidrome)**

* [paigely/Navic GitHub](https://github.com/paigely/Navic)

* Not responsive user interface, footer player is fixed all time.
* Android ".apk" size 7.97 MB

# Radio

## Radio Notes

* Navidrome only supports `.mp3` stream. For other stream format, transcoding (ffmpeg) is required.
* Get `.mp3`, `.aac` stream from [radio-browser.info](https://www.radio-browser.info/)
* Use VLC on Windows/Linux to play radio all format.
* Use AIMP on Android to play radio.

## Radio URL

* [radio-browser.info](https://www.radio-browser.info/)
* [radio-bangladesh.com](https://radio-bangladesh.com/)

## Radio Stations

* Dhaka FM 90.4
  * URL (MP3): `http://118.179.219.244:8000/;?n=d70ecddb2aebf420177c`
  * Home Page: `http://www.dhakafm904.com/`

* Jago FM 94.4
  * URL (MP3): `http://139.59.86.99:12496/stream`
  * Home Page: `http://www.jago.fm/`

* Radio Bhumi
  * URL (MP3): `https://stream-156.zeno.fm/be5bqmk1k18uv`
  * Home Page: `https://www.radiobhumi.fm/`

* Radio GoonGoon
  * URL (MP3): `https://audio.streamcast.xyz/listen/radiogoongoon/radio.mp3`
  * Home Page: `https://radiogoongoon.com/`

* Peoples Radio 91.6 FM
  * URL (MP3): `https://s3.myradiostream.com:14498/listen.mp3`
  * Home Page: `https://peoplesradio.fm/`

* Radio Ullash
  * URL (MP3): `http://stream.zeno.fm/gpgkgp9mp18uv.mp3`
  * Home Page: `https://radioullash.com/`

* Radio Foorti 88.0 FM
  * URL (MP3): `http://119.148.23.88:1021/;stream/1/`
  * Home Page: `https://radiofoorti.fm/`

* Radio Amber 102.4
  * Navidrome URL: `http://118.179.215.45:8000/;stream.mp3`
  * Home Page: `http://www.radioamber.com/#/home`

* Radio Today 89.6 FM

* ABC Radio 89.2 FM

* Radio Ekattor 98.4 FM

## Navidrome Radio Issue

### ChatGPT: “Radio streaming working on vlc, but not on navidrome”

* This is a very common Navidrome issue, and the key point is:

* VLC can play many streams that Navidrome intentionally refuses to play.

* Below is the exact reason + fixes, specifically for Bangladeshi radio streams.

**Why it works in VLC but NOT in Navidrome**

* Navidrome is much stricter than VLC.

**1️⃣ Unsupported stream types**

* Most Bangladeshi stations use:
  * HLS streams (`.m3u8`)
  * ICY/Shoutcast with odd headers
  * AAC+ (HE-AAC v2)

* VLC supports all of these.

* ❌ Navidrome does NOT support:
  * HLS (`.m3u8`)
  * Streams that don’t expose a clean MP3/AAC endpoint
  * Streams that require browser-style headers

* Navidrome expects:
  * `audio/mpeg` (MP3) or
  * `audio/aac` 
  * with clean ICY metadata

**2️⃣ Redirects & HTTPS quirks**

* Many stations:
  * Redirect HTTP → HTTPS
  * Use invalid or partial SSL chains

* VLC ignores this.
* Navidrome does not.

**3️⃣ Navidrome does not “transcode” radio**

  * Navidrome never transcodes radio streams.
  * If the stream isn’t already compatible, it will silently fail.

**✅ How to FIX this (best → worst)**

**✅ FIX #1 (BEST): Use a local proxy / restreamer**

* This is the only 100% reliable solution.

* You convert the stream VLC can play → `clean MP3 stream` Navidrome can play.


* Option A: `ffmpeg` (simple)

```shell
  ffmpeg -i "HLS_OR_BAD_STREAM_URL" \
    -map 0:a \
    -c:a libmp3lame -b:a 128k \
    -f mp3 \
    http://127.0.0.1:8000/radio.mp3
```
  * Then use this URL in Navidrome: `http://YOUR_SERVER_IP:8000/radio.mp3`

* Option B: `icecast` + `ffmpeg` (recommended)
  * Install `Icecast`
  * Restream Bangladeshi radio as MP3
  * Add `Icecast` URLs to Navidrome
  * This is how many people run Navidrome + radio.

**✅ FIX #2: Force MP3-only streams**

* Some stations expose _hidden MP3 endpoints_.

* Try replacing:

```shell
  .m3u8  → .mp3
  /stream → /;stream.mp3
```
  * Example: `http://example.com:8000/;stream.mp3`

* ⚠️ This only works on a few stations.

**❌ What will NOT work**

* Using Radio Garden URLs

* Using TuneIn player URLs

* Using `.m3u8`

* Using streams that only work in browsers

* Expecting Navidrome to behave like VLC

**✅ Confirm if Navidrome is rejecting it**

* Check Navidrome logs: `navidrome --loglevel=debug`

* You’ll usually see:

```shell
  unsupported content-type

  invalid stream

  unexpected EOF
```

**Recommended architecture (works perfectly)**

```shell
  [Bangladesh Radio Stream]
              ↓
            ffmpeg
              ↓
           Icecast
              ↓
          Navidrome
              ↓
        Subsonic Client
```

**If you want, I can:**

* Give you exact ffmpeg + Icecast commands

* Build a Docker compose for Navidrome + Icecast

* Convert specific Bangladeshi station URLs you already have

* Just tell me:
  * 1️⃣ Your OS (Linux / Docker / NAS)\
  * 2️⃣ One stream URL that works in VLC

# References

## Websites

* [navidrome.org](https://www.navidrome.org/)

## YouTube Tutorials

* Clementine Music Player
  * [Clementine Music Player BY Tommy Thompson](<https://www.youtube.com/watch?v=4otstcZvlNg>)
