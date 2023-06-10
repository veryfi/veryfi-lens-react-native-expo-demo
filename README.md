<img src="https://user-images.githubusercontent.com/30125790/212157461-58bdc714-2f89-44c2-8e4d-d42bee74854e.png#gh-dark-mode-only" width="200">
<img src="https://user-images.githubusercontent.com/30125790/212157486-bfd08c5d-9337-4b78-be6f-230dc63838ba.png#gh-light-mode-only" width="200">

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)
# Veryfi Lens
Veryfi Lens is code (a framework) with UI for your mobile app to give it document capture superpowers in minutes.

Let Veryfi handle the complexities of frame processing, asset preprocessing, edge routing, and machine vision challenges in document capture. We have been at this for a long time and understand the intricate nature of mobile capture. That’s why we built Lens. Veryfi Lens is built by developers for developers; making the whole process of integrating Lens into your app fast and easy with as few lines as possible.

Veryfi Lens is a Framework: a self-contained, reusable chunks of code and resources you can import into you app.

Lens is built in native code and optimized for fast performance, clean user experience and low memory usage.

You can read further about Lens in Veryfi's dedicated page: https://www.veryfi.com/lens/

## Table of content
1. [Configuration](#configuration)
2. [Expo EAS Configuration](#expo_eas)
3. [iOS Localization](#localization)
4. [Other platforms](#other_platforms)
5. [Get in contact with our team](#contact)

### Configuration <a name="configuration"></a>
Min SDK Android 6.0 (API level 23)

Min iOS version 12
- Go to Lens: Maven (Android) section and generate your access credentials [here](https://hub.veryfi.com/api/settings/keys/#package-managers-container).
- Add your Maven credentials to your system environment. Replace [USERNAME] and [PASSWORD] with the credentials that were set up in the previous step.
```
export MAVEN_VERYFI_USERNAME=[USERNAME]
export MAVEN_VERYFI_PASSWORD=[PASSWORD]
```

- Go to Lens: React Native (iOS + Android) section and generate your access credentials [here](https://hub.veryfi.com/api/settings/keys/#package-managers-container).
- Add your NPM credentials to your system enviroment. Replace [USERNAME] and [PASSWORD] with the credentials that were set up in the previous step.
```
export NPM_USERNAME=[USERNAME]
export NPM_PASSWORD=[PASSWORD]
```
- Clone this repository
- Check if the .npmrc file in the root of this project has this structure
```
@veryfi:registry=https://nexus.veryfi.com/repository/npm/
config=set
//nexus.veryfi.com/repository/npm/:username=${NPM_USERNAME}
//nexus.veryfi.com/repository/npm/:_password=${NPM_PASSWORD}
```
- Run `npm i @veryfi/react-native-veryfi-lens`
- Replace credentials in `App.tsx` with yours
```
const veryfiLensCredentials = {
  url: 'yourUrl',
  clientId: 'yourClientId',
  userName: 'yourUsername',
  apiKey: 'yourApiKey',
};
```
- For Android Check if the build.gradle inside the android/app has the following configuration
```
android {
    aaptOptions {
        noCompress "veryfi"
    }
}
```
This is necessary to avoid the compresion of the Veryfi machine learning models
- Also check in the `manifest.xml` inside `android/app/src/debug` that the `<application>` tag has 
`tools:replace="android:usesCleartextTraffic,android:allowBackup"` and set the value that you want for that configration in your project
- Run your desired platform using: `npx expo run:android` or `npx expo run:ios`

### Expo EAS Configuration
If you use EAS to build your iOS or Android project, you need to add in the `Secrets` section of your EAS project the variable enviroments that you set in the previous step with your credentials.
```
MAVEN_VERYFI_USERNAME=[USERNAME]
MAVEN_VERYFI_PASSWORD=[PASSWORD]
NPM_USERNAME=[USERNAME]
NPM_PASSWORD=[PASSWORD]
```

### iOS Localization (Optional) <a name="localization"></a>
- In order to be able to enable iOS Lens native localization you need to enable a supported language on the project file:
![Step 1](https://raw.githubusercontent.com/veryfi/veryfi-lens-react-native-demo/main/github_assets/localization-step1.png)

- Generate  localization files for the desired language (for example in storyboard):
![Step 2](https://raw.githubusercontent.com/veryfi/veryfi-lens-react-native-demo/main/github_assets/localization-step2.png)

- At the end you should have at least 1 file localized for each language that you want to enable localization, see example:
![Step 3](https://raw.githubusercontent.com/veryfi/veryfi-lens-react-native-demo/main/github_assets/localization-step3.png)

### Other platforms <a name="other_platforms"></a>
We also support the following wrappers for native and hybrid frameworks:
- [Cordova](https://hub.veryfi.com/lens/docs/cordova/)
- [Capacitor](https://hub.veryfi.com/lens/docs/capacitor/)
- [Flutter](https://hub.veryfi.com/lens/docs/flutter/)
- [Xamarin](https://hub.veryfi.com/lens/docs/xamarin/)
- [iOS](https://hub.veryfi.com/lens/docs/ios/)
- [Android](https://hub.veryfi.com/lens/docs/android/)

If you don't have access to our Hub, please contact our sales team, you can find the contact bellow.

### Get in contact with our sales team <a name="contact"></a>
Contact sales@veryfi.com to learn more about Veryfi's awesome products.
