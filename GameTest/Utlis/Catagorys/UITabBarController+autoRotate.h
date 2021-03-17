//
//  UITabBarController+autoRotate.h
//  bwclassgoverment
//
//  Created by 刘帅 on 2018/5/8.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Rotation)
//*******强制横竖屏********
-(BOOL)shouldAutorotate;
-(NSUInteger)supportedInterfaceOrientations;

@end
