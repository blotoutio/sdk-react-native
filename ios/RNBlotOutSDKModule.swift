//
//  RNBlotOutSDKModule.swift
//  RNBlotOutSDKModule
//
//  Copyright © 2021 BlotOut. All rights reserved.
//

import Foundation

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
    func initializeAnalyticsEngine(blotoutSDKKey: String, endPointUrl: String){
        
    }
    
    @objc
    func enable(enabled: CFBoolean){
        
    }
    
    @objc
    func capturePersonal(eventName: String, eventInfo: NSMapTable<AnyObject, AnyObject>, isPHI: CFBoolean){
        
    }
    
    @objc
    func capture(eventName: String, eventInfo: NSMapTable<AnyObject, AnyObject>){
        
    }
    
    @objc
    func mapID(mapIdData: String,withInformation:NSMapTable<AnyObject, AnyObject>){
        
    }
}
