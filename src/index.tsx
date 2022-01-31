import { NativeModules } from 'react-native'

const BlotoutSDK = {
  init : NativeModules.RNBlotOutSDKModule.initializeAnalyticsEngine,
  capture : NativeModules.RNBlotOutSDKModule.capture,
  capturePersonal :
    NativeModules.RNBlotOutSDKModule.capturePersonal,
  getUserId : NativeModules.RNBlotOutSDKModule.getUserId,
  mapID : NativeModules.RNBlotOutSDKModule.mapID,
  transaction : NativeModules.RNBlotOutSDKModule.transaction,
  item : NativeModules.RNBlotOutSDKModule.item,
  persona : NativeModules.RNBlotOutSDKModule.persona
}

export default BlotoutSDK
