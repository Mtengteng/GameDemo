//
//  AppDelegate.h
//  GameTest
//
//  Created by 马腾 on 2019/3/13.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//*******强制横竖屏********
@property (assign , nonatomic) BOOL isForceLandscape;
@property (assign , nonatomic) BOOL isForcePortrait;

@end

