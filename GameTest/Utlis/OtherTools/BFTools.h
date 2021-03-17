//
//  BFTools.h
//  bfclass
//
//  Created by 马腾 on 16/2/25.
//  Copyright © 2016年 fltrp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFTools : NSObject

+(BOOL)isLoginin;

//字典转换成json
+ (NSString *)DictionaryToJson:(NSDictionary *) dictionary;

////根据字体，限定的宽度，计算一个字符串的高度
//+ (CGSize) SizeWithString:(NSString*) string withFont:(UIFont*) font withWidth:(CGFloat) width;
//
////根据字体，计算字符串的宽，高度限定为0.0
//+ (CGSize)SizeWithString:(NSString *)string withFont:(UIFont *)font;

//根据毫秒数返回 NSDate对象
//time 毫秒数 long 类型
+ (NSDate*)DateFromTime:(long) time;

//返回日期字符串
//formatter 格式化形式＝“yyyy-mm-dd hh-mm-ss”
+ (NSString*)StringFromDate:(NSDate*)date formatter:(NSString*) formatter;

//返回日期字符串
//time 毫秒数
+ (NSString*)StringfromTime:(long) time formatter:(NSString*) formatter;

//字符串转日期
+ (NSDate*)DateFromString:(NSString*) date formatter:(NSString*) formatter;

+ (NSString *)formatSecondsToString:(NSInteger)seconds;

////支持照相
//+ (BOOL) isCameraAvailable;
//
////支持前置摄像头
//+ (BOOL) isFrontCameraAvailable;
//
////后置摄像头
//+ (BOOL) isRearCameraAvailable;
//
//// 检查摄像头是否支持录像
//+ (BOOL) doesCameraSupportShootingVideos;
//
//// 检查摄像头是否支持拍照
//+ (BOOL) doesCameraSupportTakingPhotos;
//
//// 是否可以在相册中选择照片
//+ (BOOL) canUserPickPhotosFromPhotoLibrary;
//
//// 是否可以在相册中选择视频
//+ (BOOL) canUserPickVideosFromPhotoLibrary;
//
//// 相册是否可用
//+ (BOOL) isPhotoLibraryAvailable;

// 缩图
//+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

//邮箱是否合法
+(BOOL) isValidateEmail:(NSString*)email;

//邮箱是否有效
+(BOOL) validateEmail:(NSString*)email;

//密码是否合法
+(BOOL) isValidateString:(NSString *)myString;

//判断只含有数字
+ (BOOL)isPureInt:(NSString*)string;

//随机字符串
+ (NSString *)generateTradeNO;

+ (NSString *)getIDFV;

//保存数据精度
+(NSString *)reviseString:(NSString *)string;

//开启倒计时
+ (void)countdownTimeByDuration:(NSInteger)duration start:(void(^)(NSInteger timeOut))startBlock end:(void(^)(void))endBlock;
@end
