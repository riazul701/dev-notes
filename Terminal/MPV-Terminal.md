# MPV-Terminal.md

# Concept

## Play Video Over SSH Connected Terminal

### ChatGPT: "ssh connection video play"

* Playing videos over SSH — especially in a headless or terminal-only environment — is totally possible and there are several ways to do it depending on what exactly you want: audio, ASCII/ANSI video, or actual GUI video forwarded over SSH.

**🧭 Options for Playing Video Over SSH**

* ✅ 1. ASCII Video Playback in Terminal (No GUI)
  * 🔧 Using `mpv` with `--vo=tct` or `--vo=caca`
  ```bash
  ssh user@remote-server
  mpv --vo=tct video.mp4
  ```
  * Plays video as colored block art (tct) or ASCII (caca).
  * Works in any terminal that supports color/Unicode.
  * ✅ Audio works if the remote machine has speakers or streams sound back (see below).
  * Note: `tct` is the best modern option. `caca` needs `libcaca`.

  * Example with audio muted:
  ```bash
  mpv --vo=tct --mute=yes video.mp4
  ```

* 🔈 2. Play Video Audio Over SSH (Local Sound)
  * Playing audio remotely and hearing it locally is more complex. SSH alone doesn’t forward sound, but you can:

  * 🛠 Option 1: Use PulseAudio over SSH
    * On local machine:
    ```bash
    pactl load-module module-native-protocol-tcp auth-anonymous=1
    ```
    * On remote machine:
    ```bash
    export PULSE_SERVER=your-local-ip
    mpv --ao=pulse video.mp4
    ```
  
  * 🛠 Option 2: Use mpv to stream audio over network
    ```bash
    mpv --ao=pcm --ao-pcm-file=/dev/stdout video.mp4 | ssh user@local-aplay 'aplay'
    ```
    * ⚠️ Latency and sync issues possible.

* 🎥 3. Fake Video Playback via ASCII Frame Loop
  * If you don’t want real video but an illusion of it:
  ```bash
  ffmpeg -i video.mp4 -vf fps=10 frame_%04d.png
  for f in frame_*.png; do
      clear
      chafa "$f"
      sleep 0.1
  done
  ```
  * SSH into remote.
  * Plays as sequence of chafa-rendered frames.
  * ⚠️ Just for fun/testing.

* 🖼 4. Real GUI Video Playback Over SSH (X11 Forwarding)
  * If both systems support X11:
    * On local machine:
    ```bash
    ssh -X user@remote
    mpv video.mp4
    ```
    * Requires `xauth` and X11.
    * Slower, high latency.
    * Only works with a GUI-capable system and `DISPLAY`.

**🔥 Best Option for True Terminal Video Over SSH**

```bash
mpv --vo=tct video.mp4
```
* Fast.
* Requires no GUI.
* Works over SSH.
* Looks decent in color terminals.
* You can also increase ASCII fidelity with:
```bash
mpv --vo=tct:background=dark --really-quiet video.mp4
```

* 📦 Installation (on remote machine)
  ```bash
  sudo apt install mpv libcaca0 ffmpeg chafa
  ```
  * Optional: `tmux` or `screen` to maintain session.

**📝 Summary**

* Title: Use Case => Best Tool / Command
* ASCII video over SSH => `mpv --vo=tct video.mp4`
* Audio + ASCII => `mpv --vo=tct --ao=pulse` (with PulseAudio)
* GUI video over SSH => `ssh -X` + `mpv`
* Fake frame-based playback => `ffmpeg` + `chafa` in loop
* Stream audio to local => `aplay` over pipe

**Would you like a script that plays a video in ASCII automatically when you SSH into a machine?**

## Play Video Over SSH Mount

* File Manager: `Yazi`

### ChatGPT: "ssh mount video playback"

* If you want to play a video from a remote machine via SSH — but mount the remote directory locally so you can play the video as if it were on your own system — that’s a great approach. It allows smooth playback, local decoding, and no need to run media players remotely.

**🎯 Goal:**

* Mount a remote folder over SSH (e.g. `/home/user/videos`)
* Play videos from it locally using `mpv`, `vlc`, etc.

**✅ Best Method: SSHFS (SSH File System)**

* 📦 Install SSHFS
  * On your local machine:
  ```bash
  sudo apt install sshfs    # Debian/Ubuntu
  # or
  sudo dnf install sshfs    # Fedora
  ```

* 🔌 Mount the Remote Directory
  ```bash
  mkdir ~/remote-videos
  sshfs user@remote-host:/path/to/videos ~/remote-videos
  ```
  * Replace `user@remote-host` with your SSH login.
  * Replace `/path/to/videos` with the actual video directory.
  * Now `~/remote-videos` will contain all the remote video files — accessible as if they were local files.

* ▶️ Play Videos Locally
  * Now just run:
  ```bash
  mpv ~/remote-videos/movie.mp4
  ```
  * or
  ```bash
  vlc ~/remote-videos/movie.mp4
  ```
  * ✅ Playback is done entirely on your local system, over the SSH-mounted file.

* 📤 Unmount When Done
  ```bash
  fusermount -u ~/remote-videos    # Linux
  ```
  * or
  ```bash
  umount ~/remote-videos           # macOS / BSD
  ```

**🛠️ Advanced Tips**

* 🔁 Auto-mount with Fstab
  * To mount on boot or script it easily, add this to your `~/.bashrc` or create a script:
  ```bash
  sshfs user@remote:/videos ~/remote-videos -o reconnect,ServerAliveInterval=15,ServerAliveCountMax=3
  ```

* ⚡ Performance Tip
  * To improve streaming performance, mount with these SSHFS options:
  ```bash
  sshfs user@remote:/videos ~/remote-videos -o cache=yes,reconnect,compression=no,follow_symlinks
  ```
  * Or use async I/O:
  ```bash
  -o big_writes,async_read
  ```

**❓What If You Can’t Use SSHFS?**

* Option: `smbclient / NFS / rclone`
  * If SSHFS isn't available, consider `rclone` with SFTP backend.
  * Example:
  ```bash
  rclone mount remote:/videos ~/remote-videos --vfs-cache-mode full
  ```

**✅ Summary**

* Title: Task => Tool => Command
* Mount remote dir => `sshfs` => `sshfs user@host:/dir ~/remote-videos`
* Play video locally => Any player => `mpv ~/remote-videos/video.mp4`
* Unmount when done => `fusermount` => `fusermount -u ~/remote-videos`
* Better streaming => `sshfs` flags => `-o cache=yes,big_writes`

**Would you like a script to auto-mount and play a remote video via SSHFS?**

# References

## YouTube Tutorials

* [Watch Videos In Your Linux Terminal BY DistroTube](https://www.youtube.com/watch?v=kYJ8r4d6gy0)
