//
//  BWNetManager.h
//  bwclassgoverment
//
//  Created by 马腾 on 2018/1/11.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BWBaseReq.h"
#import "BWBaseResp.h"

#define NetManger [BWNetManager sharedInstances]

@interface BWNetManager : NSObject

+ (BWNetManager *) sharedInstances;

- (void)sendRequest:(BWBaseReq*)request
        withSucessed:(void (^)(BWBaseReq *req, BWBaseResp *resp))success
        failure:(void (^)(BWBaseReq *req, NSError *error))failure;

@end
