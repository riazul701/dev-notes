# Stable-Sound.md

# Concept

## ChatGPT: "make computer sound stable at fixed label, whatever the browser, media player sound is"

* It sounds like you want your computer’s audio volume to stay at a fixed, stable level, regardless of what app is playing sound (browser, media player, etc.).

* This is usually called “volume normalization,” “loudness leveling,” or “auto-gain control.”

* Here are the ways to achieve it depending on your operating system:

**✅ Windows (most common solution)**

* Option 1: Enable Loudness Equalization
  * Windows has a built-in setting that keeps volume stable.
    * 1. Right-click the speaker icon → Sounds
    * 2. Go to Playback tab
    * 3. Select your main audio device → Properties
    * 4. Go to the Enhancements or Advanced tab
    * 5. Enable ✔ Loudness Equalization
    * 6. Apply → OK
  * This keeps audio consistent across apps.

* Option 2: Use Windows 11 “Normalize Volume”
  * (If available on your build)
    * 1. Settings → System → Sound
    * 2. Choose your output device
    * 3. Toggle Normalize volume (reduce loud sounds)

**✅ macOS**

* macOS does not have system-wide normalization, but:

* Option 1: Enable iTunes/Apple Music Sound Check
  * 1. Open Music app
  * 2. Preferences → Playback
  * 3. Enable Sound Check
  * (Only affects Music, not entire system.)

* Option 2: Install a system-wide audio tool
  * These can normalize all audio:
    * BackgroundMusic (free) – volume leveling per-app
    * Boom 3D – includes dynamic audio leveling
    * SoundSource (Rogue Amoeba) – per-app control + normalization plugins

**✅ Linux**

* Use PulseAudio or PipeWire modules:

* PulseAudio:
```lua
pactl load-module module-loudness
```

* Or enable compressor or AGC (Automatic Gain Control) in `~/.config/pulse/daemon.conf`.

**⭐ Best universal cross-app solution (Windows/macOS/Linux)**

* Install Equalizer APO + Peace GUI (Windows)
  * Includes Compressor and Limiter that keep volume fixed no matter the source

* Install Audio Hijack / SoundSource / BackgroundMusic (macOS)

* If you want, tell me:
  * ✔ Your operating system (Windows, macOS, Linux?)
  * ✔ Whether you want automatic leveling or a hard fixed output volume
  * ✔ If this is for music, YouTube, games, or everything

* I can give you exact steps tailored to your device.
