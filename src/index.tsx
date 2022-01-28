import { NativeModules } from 'react-native'

export namespace BlotoutSDK {
  export const init = NativeModules.RNBlotOutSDKModule.initializeAnalyticsEngine
  export const capture = NativeModules.RNBlotOutSDKModule.capture
  export const capturePersonal =
    NativeModules.RNBlotOutSDKModule.capturePersonal
  export const getUserId = NativeModules.RNBlotOutSDKModule.getUserId
  export const mapId = NativeModules.RNBlotOutSDKModule.mapId
  export const transaction = NativeModules.RNBlotOutSDKModule.transaction
  export const item = NativeModules.RNBlotOutSDKModule.item
  export const persona = NativeModules.RNBlotOutSDKModule.persona
}
