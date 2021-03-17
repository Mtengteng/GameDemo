//
//  BWNetManager.m
//  bwclassgoverment
//
//  Created by 马腾 on 2018/1/11.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import "BWNetManager.h"
#import "BWBaseReq.h"
#import "BWBaseResp.h"


@interface BWNetManager()

-(NSString *)replaceClassName:(id)reqClass;

@end

@implementation BWNetManager

+ (BWNetManager *)sharedInstances
{
    static BWNetManager *netManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[BWNetManager alloc] init];
    });
    return netManager;
}

- (void)sendRequest:(BWBaseReq *)request
                withSucessed:(void (^)(BWBaseReq *, BWBaseResp *))success
                failure:(void (^)(BWBaseReq *, NSError *))failure
{
    NSString *urlString = [NSString stringWithFormat:@"%@",request.url];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer.timeoutInterval = request.timeOut !=0 ? request.timeOut : 15;
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //网络请求安全策略
    if (request.isSecurityPolicy) {
        AFSecurityPolicy *securityPolicy;
        securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
        securityPolicy.allowInvalidCertificates = false;
        securityPolicy.validatesDomainName = YES;
        manager.securityPolicy = securityPolicy;
    } else {
        manager.securityPolicy.allowInvalidCertificates = true;
        manager.securityPolicy.validatesDomainName = false;
    }
    
    __block long netState;
    //监听网络状态
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%ld",(long)status);

        netState = status;
    }];
    [manager.reachabilityManager startMonitoring];
    
    NSLog(@"\nRequest url : %@\nRequest body : %@",[request.url absoluteString],request.getRequestParametersDictionary);
    
    [manager POST:urlString parameters:[request getRequestParametersDictionary] progress:^(NSProgress * _Nonnull uploadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (request.isCancel) {
            return;
        }
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:(NSData *)responseObject options:NSJSONReadingMutableLeaves error:nil];
        
        BWBaseResp *response = [[NSClassFromString([self replaceClassName:request]) alloc] initWithJSONDictionary:json];
        
        if (ResponseCode_Success == response.errorCode) {
            
            NSLog(@"\nRequestURL : %@\nResponseCode : %d\nResponseMsg : %@\nResponseBody : %@",request.url.absoluteString,response.errorCode,response.errorMessage,json);
            
            success(request,response);
            
        }else{
            
            if (response.errorMessage != nil) {
                NSError * error = [NSError errorWithDomain:response.errorMessage code:response.errorCode userInfo:nil];
                
                NSLog(@"ERROR!!\n  \nRequestURL : %@\nResponseCode : %d\nResponseMsg : %@\nResponseBody : %@",request.url.absoluteString,response.errorCode,response.errorMessage,json);
                
                failure(request,error);
            }
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //        AFNetworkReachabilityStatusUnknown          = -1,
        //        AFNetworkReachabilityStatusNotReachable     = 0,
        //        AFNetworkReachabilityStatusReachableViaWWAN = 1,
        //        AFNetworkReachabilityStatusReachableViaWiFi = 2,
        
        if (netState == -1 || netState == 0) {
            NSError * netError = [NSError errorWithDomain:@"当前网络不可用，请检查后再试" code:-1 userInfo:nil];
            failure(request,netError);

        }else{
            NSError * netError = [NSError errorWithDomain:@"服务器连接失败，请检查后再试" code:-1 userInfo:nil];

            failure(request,netError);

        }

    }];
}


-(NSString *)replaceClassName:(id)reqClass
{
    NSString * reqStr = NSStringFromClass([reqClass class]);
    NSString * string1 = reqStr;
    NSString * string2 = @"Req";
    NSRange range = [string1 rangeOfString:string2];
    NSString *respStr = nil;
    if (range.location != NSNotFound) {
        NSString *str = [string1 substringToIndex:range.location];
        respStr = [NSString stringWithFormat:@"%@Resp",str];
    }
    return respStr;
    
}

@end
