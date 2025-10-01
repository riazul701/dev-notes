# Kodi.md

## Notes

* "Emby for Android TV" requires premium subscription for watching videos, "Emby for Kodi" addon bypasses this restriction.
* When adding Emby media server address, check `http://` protocol.

# Emby For Kodi

## EmbyCon

* [Emby Add-ons for Kodi](https://emby.media/emby-for-kodi.html)

### [Installing Kodi Add-ons](https://faush01.github.io/embycon_kodi_repo/)

* Installing Kodi Add-ons
  * Install the EmbyCon repository using one of the options below
  * Launch Kodi, open the settings and select Add-ons
  * Scroll down and select "Install from repository"
  * Scroll down and select "EmbyCon Addons"
  * Now select the add-on you want to install

* Option One - Direct download and install
  * With this approach you download the repo zip and install it directly.
    * Download the repository zip file from the link at the top
    * Save the downloaded repo zip file somewhere Kodi can access it
    * In Kodi navigate to Add-ons and select "Install from zip file"
    * If prompted with a security warning about unknown add-ons you will need to turn on "Unknown sources" in the add-on setting
    * Using the file selector select the repo zip you downloaded

* Option Two - Side load from HTTPS
  * Setup the HTTPS source
    * In Kodi navigate to the File Manager and select "Add source"
    * On the "Add file source" dialog select the "Browse" button then select "Add network location..."
    * On the "Add network location" dialog enter the following:
      * Protocol  : Web server directory (HTTPS)
      * Server address  : faush01.github.io
      * Remote path : embycon_kodi_repo
    * Leave everything else and hit the "Ok" button, then hit Cancel and close the dialogs and go back to the home screen
    * In Kodi navigate to Add-ons and select "Install from zip file"
    * If prompted with a security warning about unknown add-ons you will need to turn on "Unknown sources" in the add-on setting
    * You should now see https://faush01.github.io:443/embycon_kodi_repo as one of the sources available, select it
    * This will show you the repo addon, select it to install

* Kodi add network location setup
  * Window Title: Add network location
    * Protocol: Web server directory(HTTPS)
    * Server address: faush01.github.io
    * Browse
    * Remote path: embycon_kodi_repo
    * Port: 443
    * Username
    * Password

## ChatGPT: "emby for kodi setup instruction"

* Setting up Emby for Kodi allows you to use Kodi as a front-end for your Emby media server. This gives you a powerful media library with centralized metadata, user management, watched status syncing, and more.

* Here’s a step-by-step guide to install and set up Emby for Kodi:

**🔧 Requirements**

* Kodi (v18 Leia, v19 Matrix, or v20 Nexus or newer)
* Emby Server (v4.x or newer)
* Emby account (local or Emby Connect)
* Network connection between your Kodi device and Emby server

**🚀 Step 1: Install the Emby for Kodi Add-on**

* A. Enable Unknown Sources in Kodi
  * Open "Kodi"
  * Go to "Settings" (gear icon)
  * Go to "System"
  * Select "Add-ons"
  * Enable "Unknown sources" → Accept the warning

* B. Install Emby Repo
  * Go back to "Settings"
  * Select "File Manager"
  * Click "Add Source"
  * Add the following URL:
  ```arduino
  https://kodi.emby.media
  ```
    * Name it: `Emby`
  * Back to "Main Menu" → "Add-ons"
  * Click the "box icon" (top-left) → "Install from zip file"
  * Choose "Emby" → Select the ".zip" file inside (e.g., "repository.emby-kodi...zip")
  * Wait for "Emby Repo Add-on Installed"

* C. Install "Emby for Kodi" Add-on
  * From "Add-ons" menu → "Install from repository"
  * Select "Emby Repo"
  * Go to "Video Add-ons"
  * Select "Emby for Kodi"
  * Click "Install"
  * Wait for installation to complete

**🔗 Step 2: Connect Kodi to Emby Server**

* After installation, the "Emby for Kodi" wizard will launch
* Enter your "Emby Server URL" (e.g., `http://192.168.1.100:8096`)
* Log in with your "Emby user account"
* Choose "synchronization options":
  * Sync full library or just specific media types (Movies, TV, Music, etc.)
  * Choose if Kodi should manage its own database (Native Mode) or use Emby’s library ("Add-on Mode")
* ✅ Recommended: Use "Native Mode" for best Kodi integration
* Let it sync your media — this can take some time on the first run

**⚙️ Step 3: Configure Sync & Playback Options (Optional)**

* Open "Add-ons" > "My Add-ons" > "Video Add-ons" > "Emby for Kodi" > "Configure"
* Adjust:
  * Playback (stream from Emby vs. direct play)
  * Library sync frequency
  * Subtitles
  * Metadata preferences

**🧪 Tips & Troubleshooting**

* "Watched Status Not Syncing?"" Enable "Two-way sync" in Emby for Kodi settings
* "Performance issues?"" Use direct paths (UNC) if local network access is available
* "Library not updating?" Manually trigger a sync from the Emby for Kodi settings
* "Multiple Kodi clients?" Watched status will stay in sync as long as all use Emby

**📱 Bonus: Emby Next-Gen vs. EmbyCon**

* There are two popular Kodi plugins:
  * "Emby for Kodi (Next-Gen)"" – Fully integrates Emby into Kodi using Kodi’s native library
  * "EmbyCon" – Streams media directly from Emby (lighter setup, less integration)
* 🟢 "For full Kodi experience" (skins, add-ons, watched sync, etc.), use "Emby for Kodi (Next-Gen)".

* Let me know your Kodi version or device if you'd like platform-specific instructions (e.g., Firestick, Android TV, LibreELEC, etc.)

# References

## Websites

* [kodi.tv](https://kodi.tv/)
* [xbmc/xbmc => Kodi GitHub](https://github.com/xbmc/xbmc)
* [Emby Add-ons for Kodi](https://emby.media/emby-for-kodi.html)
