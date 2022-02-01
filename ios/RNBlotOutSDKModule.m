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
                  endPointUrl: (NSString *)endPointUrl
                  callBack: (RCTResponseSenderBlock)callBack)

RCT_EXTERN_METHOD(capture:
                  (NSString *)eventName
                  eventInfo: (NSDictionary *)eventInfo)

RCT_EXTERN_METHOD(capturePersonal :
                  (NSString*)eventName
                  eventInfo:(NSDictionary *)eventInfo
                   isPHI: (BOOL)isPHI)

RCT_EXTERN_METHOD(mapID:
                  (NSString *)externalID
                  provider:(NSString *)provider
                  withInformation: (NSDictionary *)withInformation)

RCT_EXTERN_METHOD(getUserId:
                  (RCTResponseSenderBlock)callBack)

RCT_EXTERN_METHOD(transaction:
                  (NSDictionary *)options
                  withInformation: (NSDictionary *)withInformation)

RCT_EXTERN_METHOD(item:
                  (NSDictionary *)options
                  withInformation: (NSDictionary *)withInformation)

RCT_EXTERN_METHOD(persona:
                  (NSDictionary *)options
                  withInformation: (NSDictionary *)withInformation)

@end

