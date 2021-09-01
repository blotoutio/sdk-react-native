//
//  RNBlotOutSDKModule.m
//  RNBlotOutSDKModule
//
//  Copyright © 2021 BlotOut. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNBlotOutSDKModule, NSObject)
RCT_EXTERN_METHOD(initializeAnalyticsEngine :
                  (NSString*)blotoutSDKKey
                  (NSString*)endPointUrl)
RCT_EXTERN_METHOD(capture :
                  (NSString*)eventName
                   eventInfo:(NSMapTable<AnyObject, AnyObject>*)eventInfo)
RCT_EXTERN_METHOD(capturePersonal :
                  [(NSString*)eventName
                                     eventInfo:(NSMapTable<AnyObject, AnyObject>*)eventInfo
                                    isPHI:(CFBoolean)isPHI])
RCT_EXTERN_METHOD(capture :
                  (NSString*)eventName
                   eventInfo:(NSMapTable<AnyObject, AnyObject>*)eventInfo)
RCT_EXTERN_METHOD(mapID :
                  (NSString*)mapIdData
                  withInformation:(NSMapTable<AnyObject, AnyObject>*)eventInfo)
@end
