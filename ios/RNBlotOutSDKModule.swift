//
//  RNBlotOutSDKModule.swift
//  RNBlotOutSDKModule
//
//  Copyright © 2021 BlotOut. All rights reserved.
//

import Foundation;

@objc(RNBlotOutSDKModule)
class RNBlotOutSDKModule: NSObject {
  @objc
  func constantsToExport() -> [AnyHashable : Any]! {
    return ["count": 1]
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
    
    @objc
    func initializeAnalyticsEngine(_ blotoutSDKKey: String, endPointUrl: String){
        
    }
    
    @objc
    func enable(_ enabled: CFBoolean){
        
    }
    
    @objc
    func capturePersonal(_ eventName: String, eventInfo: NSDictionary, isPHI: CFBoolean){
        
    }
    
    @objc
    func capture(_ eventName: String, eventInfo: NSDictionary){
    }
    
    @objc
    func mapID(_ mapIdData: String, withInformation:NSDictionary){
        
    }
}
