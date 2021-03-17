//
//  Config.h
//  WCourse
//
//  Created by 马腾 on 2019/1/3.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#ifndef Config_h
#define Config_h


#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define BW_StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度

#define BW_NavBarHeight 44.0

#define BW_TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度

#define BW_TopHeight (BW_StatusBarHeight + BW_NavBarHeight) //整个导航栏高度

#define DefineWeakSelf __weak __typeof(self) weakSelf = self

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define iphone7 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1920, 1080), [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define kRootView [UIApplication sharedApplication].keyWindow.viewForLastBaselineLayout

//颜色
#define BWColor(a,b,c,d) [UIColor colorWithRed:a/255.0 green:b/255.0 blue:c/255.0 alpha:d]

#define lightBlueColor [UIColor colorWithRed:24.0/255.0 green:134.0/255.0 blue:254.0/255.0 alpha:1.0]

//判断数组是否为空
#define IS_VALID_ARRAY(array) (array && ![array isEqual:[NSNull null]] && [array isKindOfClass:[NSArray class]] && [array count])
//判断字符串是否为空
#define IS_VALID_STRING(string) (string && ![string isEqual:[NSNull null]] && [string isKindOfClass:[NSString class]] && [string length])

//竖屏使用
#define PAdaptation_x(x) ((x)*SCREEN_WIDTH/375)
#define PAaptation_y(y) (((y)*(iPhoneX ? SCREEN_HEIGHT - 147 : SCREEN_HEIGHT))/667)
//横屏使用
#define LAdaptation_x(x) ((x)*(iPhoneX ? SCREEN_WIDTH - 147 : SCREEN_WIDTH)/667)
#define LAdaptation_y(y) ((y)*SCREEN_HEIGHT/375)

//下载使用
#define BWDownloadHelper_Document_Path  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]

//注册微信
#define WX_APPID @"wxa2753329c80b3fc6"

#endif /* Config_h */
