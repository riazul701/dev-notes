# React-Native.md

## App Localhost Runtime

**ChatGPT Question: "snack.expo.dev localhost alternative"**

* If you're looking for a local alternative to [snack.expo.dev](https://snack.expo.dev/) —something that runs on your own machine (localhost) instead of online—here are your best options:

* ✅ 1. Expo CLI (Local Dev Environment)
  * 📦 Install Expo CLI
```bash
npm install -g expo-cli
```
  * 🚀 Create a New Project
```bash
npx create-expo-app my-app
cd my-app
npm start
```
  * This opens the local dev server (Metro bundler) at `http://localhost:19002`
  * Press `w` to launch the app in your web browser
  * Press `a` or `i` to launch Android/iOS simulators if installed
  * Result: Just like Snack, but local, and much more powerful.

* 🧪 2. Expo DevTools
  * Running `npm start` or `expo start` launches a local control panel:
    * You get live reload
    * QR code scanning from Expo Go
    * Web preview
    * JS/console debugging
  * You can even edit your project with VS Code or your favorite IDE.

✅ 3. PlayCode/StackBlitz/CodeSandbox (limited)
  * These are browser-based code editors, but they don’t fully replace Snack because they don't integrate with Expo Go or native APIs out of the box.

* 📌 Summary
  * Title: Feature => Snack.expo.dev => Expo CLI (localhost)
  * No install needed => ✅ => ❌ (you need Node.js/npm)
  * Native preview (phone) => ✅ (Expo Go) => ✅ (Expo Go or emulator)
  * Web preview => ✅ => 	✅ (`npm start` → `w`)
  * Offline support => ❌ => ✅
  * Code sharing => ✅ (URL-based) => ✅ (via GitHub or Expo.dev)

* 💡 Want an ultra-minimal setup?
```bash
npx create-expo-app my-app --template blank
cd my-app
npm start
```
  * You can now edit `App.js`, preview on web or phone, and it behaves just like Snack—but faster and offline.

* Would you like me to give you a boilerplate project, or guide you through setting up Expo + VS Code + Web + Emulator?

# References

## Websites

* [snack.expo.dev => Develop react-native app in browser](https://snack.expo.dev/)
* [gluestack.io => NativeBase is now gluestack](https://gluestack.io/)
* [gluestack/gluestack-ui => NativeBase is evolving into gluestack-ui!](https://github.com/gluestack/gluestack-ui)

## Projects

* [ReactNativeNews/React-Native-Apps GitHub](https://github.com/ReactNativeNews/React-Native-Apps)
* [90+ React Projects with Source Code [2025]](https://www.geeksforgeeks.org/reactjs/reactjs-projects/)
* [15 React Native Projects with Source Code](https://www.zegocloud.com/blog/react-native-project)

## YouTube Tutorials

* [React Native Tutorial for Beginners BY Codevolution => PlayList](https://www.youtube.com/playlist?list=PLC3y8-rFHvwhiQJD1di4eRVN30WWCXkg1)
  * [gopinav/React-Native-Tutorials GitHub](https://github.com/gopinav/React-Native-Tutorials)
* [Every React Concept Explained in 12 Minutes BY Code Bootcamp](https://www.youtube.com/watch?v=wIyHSOugGGw)

* App Emulator
