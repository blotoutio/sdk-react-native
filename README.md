# Blotout React Native SDK

## Prerequisite

#### React-Native

- Version 0.62 or greater.
- Setting up the development environment ? Follow [these instruction](https://reactnative.dev/docs/environment-setup)

#### iOS

- Xcode

- CocoaPods (**recommended**)
  - Don't have CocoaPods setup? Follow [these instructions](https://facebook.github.io/react-native/docs/integration-with-existing-apps#configuring-cocoapods-dependencies)

#### Android

- Android Studio

## Installation

```bash
$ npm i --save-dev @blotoutio/sdk-react-native
$ cd ios && pod install && cd .. # CocoaPods on iOS needs this extra step
```

# Documentation

Read more about how to use our SDK on [documentation pages](https://docs-react-native.blotout.io).

# How to contribute

- git clone the repo

## Android

- open the "android" project in Android studio
- Check for blotoutio:sdk-android version in build.gradle, if require update the version

```
dependencies {
  .....
  implementation "com.github.blotoutio:sdk-android:0.9.0"
}
```

- If need to update/add API then edit RNBlotOutSDKModule.kt accordingly.
- To test new API then call them from example/src/app/index.tsx
- From example folder

```bash
$ npm run build:android
```

## iOS

- open "ios" folder
- Edit the pod file for latest Blotout-Analytics version
- install Blotout-Analytics

```bash
$ pod install
```

- open RNBlotOutSDKModule.xcworkspace in Xcode
- Edit RNBlotOutSDKModule.swift and RNBlotOutSDKModule.m for new/update/edit API
- From example folder

```bash
$ npm run build:ios
```
