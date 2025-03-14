# PulseAudio.md

## Websites

* [PulseAudio freedesktop.org](https://www.freedesktop.org/wiki/Software/PulseAudio/)
* [Pavucontrol => PulseAudio Volume Control](https://freedesktop.org/software/pulseaudio/pavucontrol/)

# Installation

## Debian/Antix

**`pactl` command in `i3` config**

* `bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status`


* `apt show pulseaudio-utils`
  * These tools provide command line access to various features of the PulseAudio sound server. Included tools are:
  * `paplay` - Playback a WAV file via a PulseAudio sink.
  * `pacat` - Cat raw audio data to a PulseAudio sink.
  * `parec` - Cat raw audio data from a PulseAudio source.
  * `pacmd` - Connect to PulseAudio's built-in command line control interface.
  * `pactl` - Send a control command to a PulseAudio server.
  * `padsp` - /dev/dsp wrapper to transparently support OSS applications.
  * `pax11publish` - Store/retrieve PulseAudio default server/sink/source settings in the X11 root window.

* `sudo apt install pulseaudio-utils`
