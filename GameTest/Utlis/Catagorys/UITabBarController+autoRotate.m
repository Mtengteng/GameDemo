//
//  UITabBarController+autoRotate.m
//  bwclassgoverment
//
//  Created by 刘帅 on 2018/5/8.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import "UITabBarController+autoRotate.h"

@implementation UITabBarController (Rotation)
//*******强制横竖屏********
- (BOOL)shouldAutorotate
{
    return [self.selectedViewController shouldAutorotate];
}
// 返回nav栈中的最后一个对象支持的旋转方向
- (NSUInteger)supportedInterfaceOrientations
{
    return [self.selectedViewController supportedInterfaceOrientations];
}
// 返回nav栈中最后一个对象,坚持旋转的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.selectedViewController preferredInterfaceOrientationForPresentation];
}


@end
