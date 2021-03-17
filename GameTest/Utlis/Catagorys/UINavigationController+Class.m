//
//  UINavigationController+class.m
//  WCourse
//
//  Created by 马腾 on 2019/1/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "UINavigationController+Class.h"

@implementation UINavigationController (Class)

#pragma mark - 设置导航栏 -
- (void)setUpMyNavigationBarWithColor:(UIColor *)color alpha:(CGFloat)alpha
{
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:18],NSFontAttributeName,nil]];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]]; //去掉黑线
    UIColor * barTineColor = color;
    UIImage *backGroundImage = [self imageWithColor:barTineColor];
    [self.navigationBar setBackgroundImage:backGroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
}
@end
