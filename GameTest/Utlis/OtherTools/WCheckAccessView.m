//
//  BWAlertView.m
//  bwclassgoverment
//
//  Created by 马腾 on 2018/3/2.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import "WCheckAccessView.h"
#import "ECAuthorizationTools.h"

@interface WCheckAccessView ()
{
    BOOL isPhoto;
    BOOL isMic;
    BOOL isCamera;
}
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *nextBtn;


@end

@implementation WCheckAccessView

- (instancetype)init
{
    if (self = [super init]) {
        

        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_bgView];
        
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.centerX.equalTo(self);
            make.width.mas_equalTo(PAdaptation_x(300));
            make.height.mas_equalTo(PAaptation_y(264));
        }];
        
        DefineWeakSelf;

        UILabel *label = [[UILabel alloc] init];
        label.text = @"权限提示";
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = lightBlueColor;
        label.textAlignment = NSTextAlignmentCenter;
        [_bgView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weakSelf.bgView);
            make.centerX.equalTo(weakSelf.bgView);
            make.width.equalTo(weakSelf.bgView);
            make.height.mas_equalTo(PAaptation_y(44));
        }];
        
        
        NSArray *titleArray = @[@"微课坊需要获取您的相册权限？",@"微课坊需要获取您的麦克风权限?",@"微课坊需要获取您的摄像头权限？"];
        for (NSInteger i = 0; i < titleArray.count; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i;
            [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
            [_bgView addSubview:button];
            
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(PAaptation_y(44+44*i));
                make.left.equalTo(weakSelf.bgView);
                make.width.equalTo(weakSelf.bgView);
                make.height.mas_equalTo(PAaptation_y(44));
            }];
            
            
            UILabel *titleLabel = [[UILabel alloc] init];
            titleLabel.text = [titleArray safeObjectAtIndex:i];
            titleLabel.textAlignment = NSTextAlignmentLeft;
            titleLabel.font = [UIFont systemFontOfSize:14.0];
            [button addSubview:titleLabel];
            
            [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(button);
                make.left.equalTo(button).with.offset(PAdaptation_x(20));
                make.right.equalTo(button).with.offset(-PAdaptation_x(64));
                make.height.mas_equalTo(PAaptation_y(44));
            }];
            
           
            
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.tag = i+1000;
            if (i == 0) {
                isPhoto = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isPhoto"] boolValue];
                if (isPhoto) {
                    [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];

                }else{
                    [imageView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];

                }
            }else if(i == 1){
                isMic = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isMic"] boolValue];
                if (isMic) {
                    [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];

                }else{
                    [imageView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];

                }
            }else{
                isCamera = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isCamera"] boolValue];
                if (isCamera) {
                    [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];

                }else{
                    [imageView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];

                }
            }
            [button addSubview:imageView];
            
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(button.mas_right).with.offset(-PAdaptation_x(20));
                make.centerY.equalTo(button);
                make.width.mas_equalTo(PAdaptation_x(30));
                make.height.mas_equalTo(PAaptation_y(30));
            }];
            
        }
        
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextBtn.enabled = NO;
        [_nextBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_nextBtn.titleLabel setFont:[UIFont boldSystemFontOfSize:16.0]];
        [_nextBtn setBackgroundColor:lightBlueColor];
        [_nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
        [_bgView addSubview:_nextBtn];
        
        [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(weakSelf.bgView).with.offset(-PAaptation_y(20));
            make.left.equalTo(weakSelf.bgView).with.offset(PAdaptation_x(20));
            make.right.equalTo(weakSelf.bgView).with.offset(-PAdaptation_x(20));
            
        }];
        
        
    }
    
    return self;
}

- (void)clickAction:(UIButton *)button
{
    
    DefineWeakSelf;
    if (button.tag == 0) {
        
        [ECAuthorizationTools checkAndRequestAccessForType:ECPrivacyType_Photos accessStatus:^(ECAuthorizationStatus status, ECPrivacyType type) {
            if (status == ECAuthorizationStatus_Authorized) {
                self->isPhoto = YES;
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:self->isPhoto] forKey:@"isPhoto"];
                
                UIImageView *imageView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];
            }else{
                UIImageView *imgView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imgView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];
                
                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                
                if([[UIApplication sharedApplication] canOpenURL:url]) {
                    
                    NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    [[UIApplication sharedApplication] openURL:url];
                    
                }
                

            }
            if (self->isPhoto && self->isMic && self->isCamera) {
                weakSelf.nextBtn.enabled = YES;
            }
        }];
    }
    if (button.tag == 1) {
        [ECAuthorizationTools checkAndRequestAccessForType:ECPrivacyType_Microphone accessStatus:^(ECAuthorizationStatus status, ECPrivacyType type) {
            if (status == ECAuthorizationStatus_Authorized) {
                self->isMic = YES;
                
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:self->isMic] forKey:@"isMic"];
                UIImageView *imageView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];
            }else{
                UIImageView *imgView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imgView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];
                
                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                
                if([[UIApplication sharedApplication] canOpenURL:url]) {
                    
                    NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    [[UIApplication sharedApplication] openURL:url];
                    
                }
                
            }
            if (self->isPhoto && self->isMic && self->isCamera) {
                weakSelf.nextBtn.enabled = YES;
            }
        }];
    }
    if (button.tag == 2) {
        [ECAuthorizationTools checkAndRequestAccessForType:ECPrivacyType_Camera accessStatus:^(ECAuthorizationStatus status, ECPrivacyType type) {
            if (status == ECAuthorizationStatus_Authorized) {
                self->isCamera = YES;
                
                [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:self->isCamera] forKey:@"isCamera"];
                UIImageView *imageView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imageView setImage:[UIImage imageNamed:@"duigou_select.png"]];
            }else{
                UIImageView *imgView = (UIImageView *)[weakSelf.bgView viewWithTag:button.tag+1000];
                [imgView setImage:[UIImage imageNamed:@"duigou_unselect.png"]];
                
                NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                
                if([[UIApplication sharedApplication] canOpenURL:url]) {
                    
                    NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
                    [[UIApplication sharedApplication] openURL:url];
                    
                }
            }
            if (self->isPhoto && self->isMic && self->isCamera) {
                weakSelf.nextBtn.enabled = YES;
            }
        }];
    }


    
}
- (void)nextAction:(id)sender
{
    [self removeFromSuperview];

}

- (void)showAlertView{

    UIWindow *rootWindow = [UIApplication sharedApplication].delegate.window;
    [rootWindow addSubview:self];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {

        make.edges.equalTo(rootWindow.rootViewController.view);
    }];
    
    [self creatShowAnimation];
}
- (void)creatShowAnimation
{

    DefineWeakSelf;
    _bgView.layer.position = self.center;
    _bgView.transform = CGAffineTransformMakeScale(0.90, 0.90);
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        weakSelf.bgView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    } completion:^(BOOL finished) {
        
    }];
}
//- (void)click:(UIButton *)sender
//{
//    _clickBlock(sender.tag);
//
////    [self removeFromSuperview];
//}


@end
