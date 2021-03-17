//
//  UIColor+Util.h
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

+ (UIColor *)colorWithRGBString:(NSString *)colorString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBString:(NSString *)colorString;

//导航栏title颜色
+ (UIColor *)titleBarColor;
+ (UIColor *)selectTitleBarColor;
//导航栏背景色
+ (UIColor *)navigationbarColor;

//侧滑cell编辑按钮颜色
+ (UIColor *)swCellRightButtonEditColor;
//侧滑cell删除按钮颜色
+ (UIColor *)swCellRightButtonDeleteColor;

//系统主题色（内容视图背景色）
+ (UIColor *)themeColor;
//主标题颜色：兰色
+ (UIColor *)mainTitleColor;
//弹出框标题颜色：蓝色
+ (UIColor *)dialogTitleColor;
//页面按钮颜色：蓝色
+ (UIColor *)buttonColor;

//拜访步骤颜色
+ (UIColor *)firstStep;
+ (UIColor *)secondStep;
+ (UIColor *)thirdStep;
+ (UIColor *)fourthStep;
+ (UIColor *)fifthStep;
+ (UIColor *)sixthStep;
+ (UIColor *)seventhStep;

//查看考勤背景色
+ (UIColor *)dateCircleColor;
//拜访详情背景色
+ (UIColor *)visitConditionDetailBackColor;
//拜访详情字颜色
+ (UIColor *)visitConditionDetailDayColor;

//绘图黄线颜色
+ (UIColor *)yellowLineGraphColor;
//绘图红线颜色
+ (UIColor *)redLineGraphColor;
//分割线颜色：浅灰色
+ (UIColor *)cutOffColor;
//未选cell颜色：浅蓝灰色
+ (UIColor *)unSelectedColor;
//可点击链接颜色：蓝色
+ (UIColor *)clickLineColor;

//退出按钮红色
+(UIColor *)exitRedColor;
//退出按钮点下深红色
+(UIColor *)exitClickRedColor;
//未选择的选项卡颜色 浅蓝灰色
+(UIColor *)unselectedPageColor;


//进度条：红色
+ (UIColor *)redPrecessColor;
//进度条：黄色
+ (UIColor *)yellowPrecessColor;
//进度条：绿色
+ (UIColor *)greenPrecessColor;
//进度条：兰色
+ (UIColor *)bluePrecessColor;
//进度条：紫色
+ (UIColor *)purplePrecessColor;
//主按钮橙色
+(UIColor *)orangeAnalysisColor;
//获取序号随机色
+ (UIColor *)getRandenColorWithNumBer:(NSInteger)num;
@end
