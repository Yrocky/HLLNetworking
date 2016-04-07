//
//  HLLCustomNetworking.m
//  HLLNetworking
//
//  Created by admin on 16/2/22.
//  Copyright © 2016年 HLL. All rights reserved.
//

#import "HLLCustomNetworking.h"

@interface HLLCustomNetworking ()

@property (nonatomic ,strong) NSURLSession         * session;
@property (nonatomic ,strong) NSURLSessionDataTask * dataTask;
@end

@implementation HLLCustomNetworking

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.method = [HLLGETMethodType type];
        self.requestType = [HLLHTTPBodyType type];
        self.responseType = [HLLHttpDataType type];
        self.timeoutInterval = @(5);
        
        self.session = [NSURLSession sharedSession];
        
        self.HTTPHeaderFieldsWithValues = [NSMutableDictionary dictionary];

    }
    return self;
}

- (void)startRequest{

//    重置数据
    self.originalResponseData = nil;
    self.serializerResponseData = nil;
    
    //设置request
    if ([self.requestType isKindOfClass:[HLLHTTPBodyType class]]) {

    }else if ([self.requestType isKindOfClass:[HLLJsonBodyType class]]){
    
    }else if ([self.requestType isKindOfClass:[HLLPlistBodyType class]]){
        
    }else{
        
    }
    
// 设置response
//    设置请求头
//    设置超时请求
    
}

- (void)cancelRequest{

}

+ (id)getMethodNetworkingWithUelString:(NSString *)urlString
                     requestDictionary:(NSDictionary *)requestDictioinary
                       requestBodyType:(HLLRequestBodyType *)requestType
                      responseDataType:(HLLResponseDataType *)responseType{
    
    HLLNetworking * networking = [[HLLCustomNetworking alloc] init];
    networking.urlString = urlString;
    networking.requestDictionary = requestDictioinary;
    networking.method = [HLLGETMethodType type];
    
    if (requestType) {
        networking.requestType = requestType;
    }
    if (responseType) {
        networking.responseType = responseType;
    }
    return networking;

}

+ (id)postMethonNetworkingWithUelString:(NSString *)urlString
                      requestDictionary:(NSDictionary *)requestDictioinary
                        requestBodyType:(HLLRequestBodyType *)requestType
                       responseDataType:(HLLResponseDataType *)responseType{

    HLLNetworking * networking = [[HLLCustomNetworking alloc] init];
    networking.urlString = urlString;
    networking.requestDictionary = requestDictioinary;
    networking.method = [HLLPOSTMethodType type];
    
    if (requestType) {
        networking.requestType = requestType;
    }
    if (responseType) {
        networking.responseType = responseType;
    }
    return networking;

}
@end
