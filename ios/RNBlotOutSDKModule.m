//
//  RNBlotOutSDKModule.m
//  RNBlotOutSDKModule
//
//  Copyright © 2021 BlotOut. All rights reserved.
//

#import <React/RCTBridgeModule.h>
@interface  RCT_EXTERN_MODULE(RNBlotOutSDKModule,NSObject)
RCT_EXTERN_METHOD(initializeAnalyticsEngine:
                  (NSString *)blotoutSDKKey
                  endPointUrl: (NSString *)endPointUrl)
RCT_EXTERN_METHOD(capture:
                  (NSString *)eventName
                  eventInfo: (NSDictionary *)eventInfo)
RCT_EXTERN_METHOD(capturePersonal :
                  [(NSString*)eventName
                  (NSDictionary *)eventInfo
                   isPHI: (CFBoolean *)isPHI])
RCT_EXTERN_METHOD(mapID:
                  (NSString *)mapIdData
                  withInformation: (NSDictionary *)withInformation)
@end
