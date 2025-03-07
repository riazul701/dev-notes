# GitHub.md

## Websites

* [GitHub Pages](https://pages.github.com/)
* [cli.github.com](https://cli.github.com/)
* [github/gitignore GitHub](https://github.com/github/gitignore)
* [GitHub Copilot => The AI editor for everyone](https://github.com/features/copilot)

* Two-Factor Authentication
  * [getaegis.app](https://getaegis.app/) OR [beemdevelopment/Aegis](https://github.com/beemdevelopment/aegis)

## GitHub Pages
* [How to see an HTML page on Github as a normal rendered HTML page to see preview in browser, without downloading?](https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview)
  * [htmlpreview/htmlpreview.github.com](https://github.com/htmlpreview/htmlpreview.github.com)
  * [GitHub Pages](https://pages.github.com/)

## Two-Factor Authentication

### [Configuring two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication) <sup>{1}</sup>

**Configuring two-factor authentication using a TOTP app <sup>{1}</sup>**

* Download a TOTP app of your choice to your phone or desktop.
* In the upper-right corner of any page on GitHub, click your profile photo, then click `Settings`.
* In the "Access" section of the sidebar, click `Password and authentication`.
* In the "Two-factor authentication" section of the page, click `Enable two-factor authentication`.
* Under "Scan the QR code", do one of the following:
  * Scan the QR code with your mobile device's app. After scanning, the app displays a six-digit code that you can enter on GitHub.
  * If you can't scan the QR code, click `setup key` to see a code, the TOTP secret, that you can manually enter in your TOTP app instead.
* The TOTP application saves your account on GitHub.com and generates a new authentication code every few seconds. On GitHub, type the code into the field under "Verify the code from the app."
* Under "Save your recovery codes", click `Download` to download your recovery codes to your device. Save them to a secure location because your recovery codes can help you get back into your account if you lose access.
* After saving your two-factor recovery codes, click `I have saved my recovery codes` to enable two-factor authentication for your account.
* Optionally, you can configure additional 2FA methods to reduce your risk of account lockout. For more details on how to configure each additional method, see `Configuring two-factor authentication using a security key` and `Configuring two-factor authentication using GitHub Mobile`.

### [Use 1Password as an authenticator for sites with two-factor authentication](https://support.1password.com/one-time-passwords/?linux) <sup>{2}</sup>

**On 1Password.com <sup>{2}</sup>**

* [Sign in](https://start.1password.com/signin/) to your account on 1Password.com.
* Select the Login item for the website, then choose `Edit`.
* Select `Add More`, then choose `One-Time Password`.
  * You may need to scroll down to see these options.
* Return to the website and choose the option to enter the one-time password code manually.
  * If you only see a QR code on the website, you’ll need to use the 1Password `browser extension` or `app` to scan it.
* Copy the code, then paste it in the `one-time password code` field on 1Password.com.
* Select `Save`.

**In the 1Password browser extension <sup>{2}</sup>**

* Open and unlock the 1Password browser extension.
* Select the Login item for the website.
* Click the ellipsis `:` and choose `Scan QR Code`.
  * If a website only presents a string of characters to copy, follow the steps to save your one-time password in the `1Password app` or `on 1Password.com`.
* Tip : If a website displays a QR code and you have an existing Login item for that site, 1Password may automatically offer to save or update a one-time password.

**In the 1Password apps <sup>{2}</sup>**

* Open and unlock 1Password
* Select the Login item for the website, then click `Edit`.
* Click `Add More`, then choose `One-Time Password`.
  * You may need to scroll down to see these options.
* Click the QR code
  * `Press QR icon` to scan the QR code from your screen or clipboard.
    * If you can’t scan the QR code, most sites will give you a string of characters you can copy and paste instead.
* Click `Save`.

# References

* next-sl: {4}

## Guides

* Two Factor Authentication

  * {1} [Configuring two-factor authentication](https://docs.github.com/en/authentication/securing-your-account-with-two-factor-authentication-2fa/configuring-two-factor-authentication)
  * {2} [Use 1Password as an authenticator for sites with two-factor authentication](https://support.1password.com/one-time-passwords/?linux)
  * {3} [Is there a free way to set up GitHub 2FA without a mobile device?](https://stackoverflow.com/questions/68824508/is-there-a-free-way-to-set-up-github-2fa-without-a-mobile-device)
  * [Free open source TOTP authenticator with either backup, online sync or device sync?](https://www.reddit.com/r/privacy/comments/j2ydqf/free_open_source_totp_authenticator_with_either/?rdt=43015)
    
## YouTube Tutorials

* Two Factor Authentication

  * [KeePassXC TOTP (2-Factor Autofill) | Complete Crash Course BY TroubleChute](https://www.youtube.com/watch?v=VEfkt29moE8)
