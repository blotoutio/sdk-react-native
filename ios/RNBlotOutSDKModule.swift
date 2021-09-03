//
//  RNBlotOutSDKModule.swift
//  RNBlotOutSDKModule
//
//  Copyright © 2021 BlotOut. All rights reserved.
//

import Foundation;
import BlotoutAnalyticsSDK

@objc(RNBlotOutSDKModule)
class RNBlotOutSDKModule: NSObject {
    @objc
    func initializeAnalyticsEngine(_ blotoutSDKKey: String, endPointUrl: String){
        let boaSDK : BlotoutAnalytics
            boaSDK =  BlotoutAnalytics.sharedInstance()!
            let config = BlotoutAnalyticsConfiguration.init(token: blotoutSDKKey, withUrl: endPointUrl)
            //config.launchOptions = launchOptions;
            boaSDK.`init`(config) { (isSuccess : Bool, errorObj:Error?) in
                if isSuccess{
                    print("Integration Successful.")
                    boaSDK.capture("AppLaunchedWithBOSDK", withInformation: nil)
                }else{
                    print("Unexpected error:.")
                }
                boaSDK.capture("AppLaunchedWithBOSDK", withInformation: nil)
            }
    }
    
    @objc
    func enable(_ enabled: CFBoolean){
        
    }
    
    @objc
    func capturePersonal(_ eventName: String, eventInfo: NSDictionary, isPHI: Bool){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.capturePersonal(eventName , withInformation: eventInfo as! [AnyHashable : Any], isPHI: isPHI )
        
    }
    
    @objc
    func capture(_ eventName: String, eventInfo: NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.capture(eventName , withInformation: eventInfo as! [AnyHashable : Any])
    }
    
    @objc
    func mapID(_ mapIdData: BOAMapIDDataModel, withInformation:NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.mapID(mapIdData, withInformation: <#T##[AnyHashable : Any]?#>)
    }
}
