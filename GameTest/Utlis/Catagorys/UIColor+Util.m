//
//  UIColor+Util.m
//  iosapp
//
//  Created by chenhaoxiang on 14-10-18.
//  Copyright (c) 2014年 oschina. All rights reserved.
//

#import "AppDelegate.h"
#import "UIColor+Util.h"

@implementation UIColor (Util)

#pragma mark - Hex

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(hexValue & 0xFF)) / 255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}
#pragma mark - #Color
+ (UIColor *)colorWithRGBString:(NSString *)colorString alpha:(CGFloat)alpha
{
    // 转换成标准16进制数
    NSRange range = [colorString rangeOfString:@"#"];
    NSString *color = [colorString stringByReplacingCharactersInRange:range withString:@"0x"];
    // 十六进制字符串转成整形。
    long colorLong = strtoul([color cStringUsingEncoding:NSUTF8StringEncoding], 0, 16);
    // 通过位与方法获取三色值
    int R = (colorLong & 0xFF0000 )>>16;
    int G = (colorLong & 0x00FF00 )>>8;
    int B =  colorLong & 0x0000FF;
    
    //string转color
    UIColor *newColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:alpha];
    return newColor;
}
+ (UIColor *)colorWithRGBString:(NSString *)colorString
{
    return [self colorWithRGBString:colorString alpha:1.0];
}

#pragma mark - navigation colors

//导航栏title颜色
+ (UIColor *)titleBarColor {
    return [UIColor whiteColor];
}

//导航栏title颜色
+ (UIColor *)selectTitleBarColor {
    return [UIColor colorWithHex:0xE1E1E1];
}
//导航栏背景色
+ (UIColor *)navigationbarColor {
    return [UIColor colorWithHex:0x00b393]; // 0x00b393
}

#pragma mark - SWcell right button colors
//侧滑cell编辑按钮颜色
+ (UIColor *)swCellRightButtonEditColor {
    return [UIColor colorWithHex:0x15A230]; // 0x009000
}
//侧滑cell删除按钮颜色
+ (UIColor *)swCellRightButtonDeleteColor {
    return [UIColor colorWithHex:0xFFA230]; // 0x009000
}

#pragma mark - theme colors
//系统主题色（内容视图背景色）：浅灰色
+ (UIColor *)themeColor {
    return [UIColor colorWithRed:237.0 / 255 green:238.0 / 255 blue:239.0 / 255 alpha:1.0];
}
//主标题颜色：绿色
+ (UIColor *)mainTitleColor {
    return [UIColor colorWithRed:84.0 / 255 green:168.0 / 255 blue:146.0 / 255 alpha:1.0];
}

//弹出框标题颜色：蓝色
+ (UIColor *)dialogTitleColor {
    return [UIColor colorWithRed:50.0 / 255 green:165.0 / 255 blue:223.0 / 255 alpha:1.0];
}

//页面按钮颜色：蓝色
+ (UIColor *)buttonColor {
    return [UIColor colorWithRed:50.0 / 255 green:165.0 / 255 blue:223.0 / 255 alpha:1.0];
}
//绘图黄线颜色
+ (UIColor *)yellowLineGraphColor {
    return [UIColor colorWithRed:255.0 / 255 green:175.0 / 255 blue:34.0 / 255 alpha:1.0];
}
//绘图红线颜色
+ (UIColor *)redLineGraphColor {
    return [UIColor colorWithRed:233.0 / 255 green:80.0 / 255 blue:100.0 / 255 alpha:1.0];
}

//分割线颜色：浅灰色
+ (UIColor *)cutOffColor {
    return [UIColor colorWithRed:241.0 / 255 green:241.0 / 255 blue:241.0 / 255 alpha:1.0];
}
//未选cell颜色：浅蓝灰色
+ (UIColor *)unSelectedColor {
    return [UIColor colorWithRed:241.0 / 255 green:242.0 / 255 blue:243.0 / 255 alpha:1.0];
}
//可点击链接颜色：蓝色
+ (UIColor *)clickLineColor {
    return [UIColor colorWithRed:54.0 / 255 green:154.0 / 255 blue:249.0 / 255 alpha:1.0];
}

#pragma mark - 进度条颜色
//进度条：红色
+ (UIColor *)redPrecessColor
{
//    return [UIColor colorWithRed:213.0 / 255 green:70.0 / 255 blue:44.0 / 255 alpha:1.0];
    return [UIColor colorWithHex:0xEB5A43];
}

//进度条：黄色
+ (UIColor *)yellowPrecessColor
{
//    return [UIColor colorWithRed:237.0 / 255 green:173.0 / 255 blue:44.0 / 255 alpha:1.0];
    return [UIColor colorWithHex:0xFBB30E];
}

//进度条：绿色
+ (UIColor *)greenPrecessColor
{
//    return [UIColor colorWithRed:84.0 / 255 green:168.0 / 255 blue:146.0 / 255 alpha:1.0];
    return [UIColor colorWithHex:0x2AA889];
}

//进度条：兰色
+ (UIColor *)bluePrecessColor
{
//    return [UIColor colorWithRed:86.0 / 255 green:148.0 / 255 blue:203.0 / 255 alpha:1.0];
    return [UIColor colorWithHex:0x5EA1D3];
}

//进度条：紫色
+ (UIColor *)purplePrecessColor
{
    return [UIColor colorWithRed:42.0 / 255 green:107.0 / 255 blue:169.0 / 255 alpha:1.0];
//    return [UIColor colorWithHex:0xFBB30E];
}
//主按钮橙色
+(UIColor *)orangeAnalysisColor
{
    return [UIColor colorWithRed:216.0 / 255 green:99.0 / 255 blue:76.0 / 255 alpha:1.0];
}

#pragma mark - 拜访步骤颜色
+ (UIColor *)firstStep {
    return [UIColor colorWithHex:0xeb5844];
}

+ (UIColor *)secondStep {
    return [UIColor colorWithHex:0x5257B4];
}

+ (UIColor *)thirdStep {
    return [UIColor colorWithHex:0xD44E53];
}

+ (UIColor *)fourthStep {
    return [UIColor colorWithHex:0xB37954];
}

+ (UIColor *)fifthStep {
    return [UIColor colorWithHex:0x41ABA9];
}

+ (UIColor *)sixthStep {
    return [UIColor colorWithHex:0x80B963];
}

+ (UIColor *)seventhStep {
    return [UIColor colorWithHex:0x6B99C0];
}


//查看考勤背景色
+ (UIColor *)dateCircleColor {
    return [UIColor colorWithHex:0x64CABE];
}
//拜访详情背景色
+(UIColor *)visitConditionDetailBackColor
{
    return [UIColor colorWithHex:0x33cc99];
}
//拜访详情字颜色
+(UIColor *)visitConditionDetailDayColor
{
    return [UIColor colorWithHex:0x75d3cb];
}

//退出按钮红色
+(UIColor *)exitRedColor
{
    return [UIColor colorWithHex:0xF05945];
}

//退出按钮点下红色
+(UIColor *)exitClickRedColor
{
    return [UIColor colorWithHex:0xc92f32];
}

//未选择的选项卡颜色 浅蓝灰色
+(UIColor *)unselectedPageColor
{
    return [UIColor colorWithHex:0xc7d6e7];
}


# pragma mark - Three Color Methods
+ (UIColor *)getRandenColorWithNumBer:(NSInteger)num
{
    NSArray *colourArr =@[
                          @"#D88C8C",@"#D8938C",@"#D8998C",@"#D89F8C",@"#D8A68C",
                          @"#D8AC8C",@"#D8B28C",@"#D8B98C",@"#D8BF8C",@"#D8C58C",
                          @"#D8CC8C",@"#D8D28C",@"#D8D88C",@"#D2D88C",@"#CCD88C",
                          @"#C5D88C",@"#BFD88C",@"#B9D88C",@"#B2D88C",@"#ACD88C",
                          @"#A6D88C",@"#9FD88C",@"#99D88C",@"#93D88C",@"#8CD88C",
                          @"#8CD893",@"#8CD899",@"#8CD89F",@"#8CD8A6",@"#8CD8AC",
                          @"#8CD8B2",@"#8CD8B9",@"#8CD8BF",@"#8CD8C5",@"#8CD8CC",
                          @"#8CD8D2",@"#8CD8D8",@"#8CD2D8",@"#8CCCD8",@"#8CC5D8",
                          @"#8CBFD8",@"#8CB9D8",@"#8CB2D8",@"#8CACD8",@"#8CA6D8",
                          @"#8C9FD8",@"#8C99D8",@"#8C93D8",@"#8C8CD8",@"#938CD8",
                          @"#998CD8",@"#9F8CD8",@"#A68CD8",@"#AC8CD8",@"#B28CD8",
                          @"#B98CD8",@"#BF8CD8",@"#C58CD8",@"#CC8CD8",@"#D28CD8",
                          @"#D88CD8",@"#D88CD2",@"#D88CCC",@"#D88CC5",@"#D88CBF",
                          @"#D88CB9",@"#D88CB2",@"#D88CAC",@"#D88CA6",@"#D88C9F",
                          @"#D88C99",@"#D88C93"
                          ];
    NSInteger colorNum = (num%24)*3 + (num/24);
    //防止溢出
    if (colorNum >71) {
        colorNum = colorNum%72;
    }
    NSString * colorStr = [colourArr objectAtIndex:colorNum];
    UIColor *color = [self colorWithRGBString:colorStr];
    return color;
}
@end
