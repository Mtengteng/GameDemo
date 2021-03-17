//
//  UIViewController+ViewControllerHelper.m
//  bfclass
//
//  Created by 刘帅 on 2018/5/17.
//  Copyright © 2018年 fltrp. All rights reserved.
//

#import "UIViewController+ViewControllerHelper.h"
#import "BFBackButton.h"

#define IS_IPHONE_X (SCREEN_HEIGHT == 812.0f) ? YES : NO
#define ARC4RAND_MAX 0x100000000

@implementation UIViewController (ViewControllerHelper)

#pragma mark -- 生成图片验证码 -
- (UIImage *)imageCodeViewWithStr:(NSString *)imageCodeStr{

    UIView *imageBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 88, 40)];
    CGSize textSize = [@"W" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    //每个label能随机产生的位置的point.x的最大范围
    int randWidth = (imageBgView.frame.size.width)/imageCodeStr.length - textSize.width;
    //每个label能随机产生的位置的point.y的最大范围
    int randHeight = imageBgView.frame.size.height - textSize.height;
    for (int i = 0; i<imageCodeStr.length; i++) {
        //随机生成每个label的位置CGPoint(x,y)
        CGFloat px = arc4random()%randWidth + i*(imageBgView.frame.size.width-3)/imageCodeStr.length;
        CGFloat py = arc4random()%randHeight;
        UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(px+3, py, textSize.width, textSize.height)];
        label.text = [NSString stringWithFormat:@"%C",[imageCodeStr characterAtIndex:i]];
        label.font = [UIFont systemFontOfSize:20];
        label.textColor = [UIColor blackColor];
        //label是否是可以是斜的，isRotation这个属性暴露在外面，可进行设置
        double r = (double)arc4random() / ARC4RAND_MAX * 2 - 1.0f;//随机生成-1到1的小数
        if (r>0.3) {
            r=0.3;
        }else if(r<-0.3){
            r=-0.3;
        }
        label.transform = CGAffineTransformMakeRotation(r);
        [imageBgView addSubview:label];
    }
    
    for (int i = 0; i<10; i++) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat pX = arc4random() % (int)CGRectGetWidth(imageBgView.frame);
        CGFloat pY = arc4random() % (int)CGRectGetHeight(imageBgView.frame);
        [path moveToPoint:CGPointMake(pX, pY)];
        CGFloat ptX = arc4random() % (int)CGRectGetWidth(imageBgView.frame);
        CGFloat ptY = arc4random() % (int)CGRectGetHeight(imageBgView.frame);
        [path addLineToPoint:CGPointMake(ptX, ptY)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = [[self getRandomBgColorWithAlpha:0.2] CGColor];//layer的边框色
        layer.lineWidth = 1.0f;
        layer.strokeEnd = 1;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.path = path.CGPath;
        [imageBgView.layer addSublayer:layer];
    }
    
    UIGraphicsBeginImageContext(imageBgView.bounds.size);
    [imageBgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (UIColor *)getRandomBgColorWithAlpha:(CGFloat)alpha{
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}
#pragma mark - 颜色转为图片 -
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 开启上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(ref, color.CGColor);
    // 渲染上下文
    CGContextFillRect(ref, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark --判断手机号合法性
- (BOOL)checkPhone:(NSString *)phoneNumber
{
    if(phoneNumber.length == 11 ){
        return YES;
    }else{
        return NO;
    }
}

#pragma mark - 适配不同机型尺寸 -
- (CGRect)setFrameWith:(CGRect)rect{
    CGRect rect1;
    rect1.origin.x = rect.origin.x / 375 * SCREEN_WIDTH;
    if (IS_IPHONE_X) {
        rect1.origin.y = rect.origin.y / 667 * (SCREEN_HEIGHT - 145);
    }else{
        rect1.origin.y = rect.origin.y / 667 * SCREEN_HEIGHT;
    }
    if (rect.size.width == rect.size.height) {
        rect1.size.width = rect.size.width / 375 * SCREEN_WIDTH;
        rect1.size.height = rect1.size.width;
    }else{
        rect1.size.width = rect.size.width / 375 * SCREEN_WIDTH;
        if (IS_IPHONE_X) {
            rect1.size.height = rect.size.height / 667 * (SCREEN_HEIGHT - 145);
        }else{
            rect1.size.height = rect.size.height / 667 * SCREEN_HEIGHT;
        }
    }
    return rect1;
}
// 字母、数字、中文正则判断（包括空格）【注意3】
- (BOOL)isInputRuleAndBlank:(NSString *)str {
    
    NSString *pattern = @"^[a-zA-Z\u4E00-\u9FA5\\d\\s]*$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
// 字母、数字
- (BOOL)isInputRule:(NSString *)str {
    
    NSString *pattern = @"^[A-Za-z0-9]{6,16}$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:str];
    return isMatch;
}
- (void)allowOrientationPortrait:(BOOL)isPortrait Landscape:(BOOL)isLandscape{
    
    AppDelegate *appdelegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    appdelegate.isForcePortrait = isPortrait;
    appdelegate.isForceLandscape = isLandscape;
    [appdelegate application:[UIApplication sharedApplication] supportedInterfaceOrientationsForWindow:self.view.window];
}
#pragma mari - 返回按钮 -
- (void)createLeftBackBtnWithImageName:(NSString *)imageName backAction:(void (^)(void))backBlock{
    
    UIImage *image = [UIImage imageNamed:imageName];
    BFBackButton *leftBtn = [BFBackButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 44, 44);
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 10);
    leftBtn.backBlock = backBlock;
    UIView *leftView = [[UIView alloc]initWithFrame:leftBtn.bounds];
    [leftBtn setImage:image forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    [leftView addSubview:leftBtn];
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftView];
    self.navigationItem.leftBarButtonItem = leftBar;
}
- (void)back:(BFBackButton *)sender{
    
    !sender.backBlock ?: sender.backBlock();
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 转场动画 -
- (CATransition *)defaultAnimationWithDuration:(NSTimeInterval)duration target:(UIView *)view type:(NSString *)type subType:(NSString *)subType{
    
    CATransition *animation = [CATransition animation];
    animation.duration = duration;
    animation.type = type;
    animation.subtype = subType;
    [view.window.layer addAnimation:animation forKey:nil];
    return animation;
}
#pragma mark - 弹框提示 -
- (void)showAlert:(UIViewController *)controller content:(NSString *)content sure:(NSString *)sureName cancel:(NSString *)cancelName sureAction:(void(^)(void))alertSureBlock cancelAction:(void(^)(void))alertCancelBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:sureName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //确认
        !alertSureBlock ?: alertSureBlock();
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //取消
        !alertCancelBlock ?: alertCancelBlock();
    }];
    [alert addAction:actionSure];
    [alert addAction:actionCancel];
    
    [controller presentViewController:alert animated:YES completion:nil];
}
//#pragma mark - 去登录页 -
//- (void)goToLoginPage:(UIViewController *)presentViewController blockCilck:(void (^)(void))loginUpDataSource{
//
//    BFNLoginViewController *loginCtrl = [[BFNLoginViewController alloc] init];
//    UINavigationController *login = [[UINavigationController alloc]initWithRootViewController:loginCtrl];
//    loginCtrl.loginUpDataSource = ^{
//        !loginUpDataSource ?: loginUpDataSource();
//    };
//    [presentViewController presentViewController:login animated:YES completion:nil];
//}
#pragma mark - 滚动到顶部 -
- (void)scrollToTop:(UITableView *)tableView toTop:(BOOL)toTop{
    
    if (toTop) {
        
        [tableView setContentOffset:CGPointMake(0, 0)];
    }
}


@end
