//
//  BWAlertView.h
//  bwclassgoverment
//
//  Created by 马腾 on 2018/3/2.
//  Copyright © 2018年 beiwaionline. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickAction)(NSInteger buttonIndex);

@interface WCheckAccessView : UIView
@property (nonatomic, copy) clickAction clickBlock;


- (void)showAlertView;

@end
