# Surge.md

## Notes

* Scroll down to download google-chrome, mozilla-firefox, microsoft-edge extension on [github releases page](https://github.com/SurgeDM/Surge/releases)

## Chrome Extension Path

* Keep surge's google-chrome extension at below path.

> ChatGPT Question:
> 
> Extension installation path of google chrome in windows 10

In **Windows 10**, Google Chrome extensions are typically stored in the user's profile directory.

***### Default Chrome Extension Location***

```text
C:\Users\<YourUserName>\AppData\Local\Google\Chrome\User Data\Default\Extensions
```

For example:

```text
C:\Users\John\AppData\Local\Google\Chrome\User Data\Default\Extensions
```

***### If You Use Multiple Chrome Profiles***

Chrome stores each profile separately:

```text
C:\Users\<YourUserName>\AppData\Local\Google\Chrome\User Data\Profile 1\Extensions
C:\Users\<YourUserName>\AppData\Local\Google\Chrome\User Data\Profile 2\Extensions
```

The main profile is usually:

```text
...\User Data\Default\
```

***### Quick Way to Open the Folder***

1. Press **Win + R**.
2. Enter:

   ```text
   %LOCALAPPDATA%\Google\Chrome\User Data\Default\Extensions
   ```
3. Press **Enter**.

***### Finding Which Folder Belongs to Which Extension***

Each extension is stored in a folder named with its extension ID. To identify an extension:

1. Open Chrome.
2. Go to:

   ```text
   chrome://extensions/
   ```
3. Enable **Developer mode** (top right).
4. The **ID** shown under each extension matches the folder name in the `Extensions` directory.

***### Microsoft Edge***

If you're using Edge instead of Chrome, the equivalent path is:

```text
C:\Users\<YourUserName>\AppData\Local\Microsoft\Edge\User Data\Default\Extensions
```

If you need the installation path for a specific extension, tell me the extension name and I can help locate its folder.

# References

## Websites

* [surgedm.github.io](https://surgedm.github.io/)
* [SurgeDM/Surge GitHub](https://github.com/SurgeDM/Surge)
