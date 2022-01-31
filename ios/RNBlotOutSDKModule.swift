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
  func  initializeAnalyticsEngine(_ blotoutSDKKey: String, endPointUrl: String){
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
    func capturePersonal(_ eventName: String, eventInfo: NSDictionary, isPHI: Bool){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.capturePersonal(eventName , withInformation: eventInfo as! [AnyHashable : Any], isPHI: isPHI )
        
    }
    
    @objc
    func capture(_ eventName: String, eventInfo: NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.capture(eventName , withInformation: eventInfo as? [AnyHashable : Any])
    }
    
    @objc
    func mapID(_ externalID: String, provider: String,withInformation:NSDictionary){
        let boaSDK : BlotoutAnalytics
        let mapIdData =  BOAMapIDDataModel()
        mapIdData.externalID = externalID
        mapIdData.provider = provider
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        boaSDK.mapID(mapIdData, withInformation: withInformation as? [AnyHashable : Any])
    }
    
    @objc
    func getUserId() -> String {
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        let userId = boaSDK.getUserId() ?? ""
          return userId
       }
    
    @objc
    func transaction(_ options:AnyObject,withInformation:NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        let transaction = TransactionData()
        
        let transaction_id = options["transaction_id"] as? String ?? ""
        let currency = options["transaction_payment"] as? String ?? ""
        let total:NSNumber = NSNumber(value: options["transaction_total"] as? Double ?? 0.0)
        let discount:NSNumber = NSNumber(value: options["transaction_discount"] as? Double ?? 0)
        let shipping:NSNumber = NSNumber(value: options["transaction_shipping"] as? Double ?? 0)
        let tax:NSNumber = NSNumber(value: options["transaction_tax"] as? Double ?? 0)
        
        transaction.transaction_id = transaction_id
        transaction.transaction_currency = currency
        transaction.transaction_total = total
        transaction.transaction_discount = discount
        transaction.transaction_shipping = shipping
        transaction.transaction_tax = tax

        boaSDK.captureTransaction(transaction, withInformation: withInformation as? [AnyHashable : Any])
    }
    
    @objc
    func item(_ options:AnyObject,withInformation:NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        let item = Item()
        
        let item_id = options["item_id"] as? String ?? ""
        let sku = options["item_sku"] as? String ?? ""
        let name = options["item_name"] as? String ?? ""
        let price:NSNumber = NSNumber(value: options["item_price"] as? Double ?? 0)
        let quantity:NSNumber = NSNumber(value: options["item_quantity"] as? Double ?? 0)
        let currency = options["item_currency"] as? String ?? ""
        let category = options["item_category"] as? [Any] ?? []
        
        item.item_id = item_id
        item.item_sku = sku
        item.item_name = name
        item.item_price = price
        item.item_quantity = quantity
        item.item_currency = currency
        item.item_category = category

        boaSDK.capture(item, withInformation: withInformation as? [AnyHashable : Any])
    }
    
   @objc
    func persona(_ options:AnyObject,withInformation:NSDictionary){
        let boaSDK : BlotoutAnalytics
        boaSDK =  BlotoutAnalytics.sharedInstance()!
        let persona = Persona()
        
        let persona_id = options["persona_id"] as? String ?? ""
        let zip:NSNumber = NSNumber(value: options["persona_zip"] as? Double ?? 0)
        let dob = options["persona_dob"] as? String ?? ""
        let age:NSNumber = NSNumber(value: options["persona_age"] as? Double ?? 0)
        let city = options["persona_city"] as? String ?? ""
        let state = options["persona_state"] as? String ?? ""
        let email = options["persona_email"] as? String ?? ""
        let number = options["persona_number"] as? String ?? ""
        
        persona.persona_id = persona_id
        persona.persona_zip = zip
        persona.persona_dob = dob
        persona.persona_age = age
        persona.persona_city = city
        persona.persona_state = state
        persona.persona_email = email
        persona.persona_number = number

        boaSDK.capture(persona, withInformation: withInformation as? [AnyHashable : Any])
    }
}

