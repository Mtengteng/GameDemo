//
//  UIViewController+ViewControllerHelper.h
//  bfclass
//
//  Created by 刘帅 on 2018/5/17.
//  Copyright © 2018年 fltrp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ViewControllerHelper)
//生成图片验证码
- (UIImage *)imageCodeViewWithStr:(NSString *)imageCodeStr;
//颜色转为图片
- (UIImage *)imageWithColor:(UIColor *)color;
//判断手机号合法性
- (BOOL)checkPhone:(NSString *)phoneNumber;
//适配
- (CGRect)setFrameWith:(CGRect)rect;
// 字母、数字、中文正则判断（包括空格）【注意3】
- (BOOL)isInputRuleAndBlank:(NSString *)str;
//数字字母正则；
- (BOOL)isInputRule:(NSString *)str;
//设置横竖屏权限
- (void)allowOrientationPortrait:(BOOL)isPortrait Landscape:(BOOL)isLandscape;
//返回按钮
- (void)createLeftBackBtnWithImageName:(NSString *)imageName backAction:(void(^)(void))backBlock;
//转场动画
- (CATransition *)defaultAnimationWithDuration:(NSTimeInterval)duration target:(UIView *)view type:(NSString *)type subType:(NSString *)subType;
//跳转登录页
- (void)goToLoginPage:(UIViewController *)presentViewController blockCilck:(void(^)(void))loginUpDataSource;
//弹框提示
- (void)showAlert:(UIViewController *)controller content:(NSString *)content sure:(NSString *)sureName cancel:(NSString *)cancelName sureAction:(void(^)(void))alertSureBlock cancelAction:(void(^)(void))alertCancelBlock;
//滚动到顶部
- (void)scrollToTop:(UITableView *)tableView toTop:(BOOL)toTop;


@end
