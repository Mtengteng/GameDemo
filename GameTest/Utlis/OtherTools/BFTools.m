//
//  BFTools.m
//  bfclass
//
//  Created by 马腾 on 16/2/25.
//  Copyright © 2016年 fltrp. All rights reserved.
//

#import "BFTools.h"

@implementation BFTools

//+ (BOOL)isLoginin
//{
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:KEY_LoginName] && [[NSUserDefaults standardUserDefaults] objectForKey:KEY_Password]) {
//        return YES;
//    }else{
//        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:KEY_UserID];
//        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:KEY_LoginName];
//        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:KEY_Password];
//        return NO;
//    }
//
//}

+ (NSString *)DictionaryToJson:(NSDictionary *)dictionary
{
    NSError *parseError = nil;
    NSString *str = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:&parseError];
    if(!jsonData || parseError){
        return str;
    }
    //Data转换为JSON
    str = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return str;
}

+ (CGSize)SizeWithString:(NSString *)string withFont:(UIFont *)font withWidth:(CGFloat)width
{
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
    return titleSize;
}

+ (CGSize)SizeWithString:(NSString *)string withFont:(UIFont *)font
{
    CGSize titleSize = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 0.0) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return titleSize;
}

+ (NSDate*)DateFromTime:(long)time
{
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    return date;
}

+ (NSString*)StringfromTime:(long)time formatter:(NSString *)formatter
{
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time/1000.0];
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    _formatter.dateFormat = formatter;
    NSString *time1 = [_formatter stringFromDate:date];
    return time1;
}

+ (NSString*)StringFromDate:(NSDate *)date formatter:(NSString *)formatter
{
    if (date == nil || [date isEqual:[NSNull null]]) {
        return @"";
    }
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    _formatter.dateFormat = formatter;
    NSString *time2 = [_formatter stringFromDate:date];
    return time2;
}

+ (NSDate*)DateFromString:(NSString *)date formatter:(NSString *)formatter
{
    if (date == nil || [date isEqualToString:@""] || [date isEqual:[NSNull null]]) {
        return nil;
    }
    
    NSDateFormatter *_formatter = [[NSDateFormatter alloc] init];
    _formatter.dateFormat = formatter;
    NSDate *_date = [_formatter dateFromString:date];
    return _date;
}
+ (NSString *)formatSecondsToString:(NSInteger)seconds
{
    NSString *hhmmss = nil;
    if (seconds < 0) {
        return @"00:00:00";
    }
    
    int h = (int)round((seconds%86400)/3600);
    int m = (int)round((seconds%3600)/60);
    int s = (int)round(seconds%60);
    
    if (h>0) {
        hhmmss = [NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s];
        
    }else{
        hhmmss = [NSString stringWithFormat:@"%02d:%02d", m, s];
        
    }
    
    
    return hhmmss;
}
+ (BOOL)isCameraAvailable
{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

// 前面的摄像头是否可用
+ (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}


// 后面的摄像头是否可用
+ (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0){
        //NSLog(@"Media type is empty.");
        return NO;
    }
    NSArray *availableMediaTypes =[UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL*stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
        
    }];
    return result;
}

// 相册是否可用
+ (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary];
}
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize
{
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
    
}
+(BOOL)isValidateEmail:(NSString *)email {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
+(BOOL)validateEmail:(NSString*)email
{
    if((0 != [email rangeOfString:@"@"].length) &&
       (0 != [email rangeOfString:@"."].length))
    {
        NSCharacterSet* tmpInvalidCharSet = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        NSMutableCharacterSet* tmpInvalidMutableCharSet = [tmpInvalidCharSet mutableCopy];
        [tmpInvalidMutableCharSet removeCharactersInString:@"_-"];
        
        
        NSRange range1 = [email rangeOfString:@"@"
                                      options:NSCaseInsensitiveSearch];
        
        //取得用户名部分
        NSString* userNameString = [email substringToIndex:range1.location];
        NSArray* userNameArray   = [userNameString componentsSeparatedByString:@"."];
        
        for(NSString* string in userNameArray)
        {
            NSRange rangeOfInavlidChars = [string rangeOfCharacterFromSet: tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length != 0 || [string isEqualToString:@""])
                return NO;
        }
        
        //取得域名部分
        NSString *domainString = [email substringFromIndex:range1.location+1];
        NSArray *domainArray   = [domainString componentsSeparatedByString:@"."];
        
        for(NSString *string in domainArray)
        {
            NSRange rangeOfInavlidChars=[string rangeOfCharacterFromSet:tmpInvalidMutableCharSet];
            if(rangeOfInavlidChars.length !=0 || [string isEqualToString:@""])
                return NO;
        }
        
        return YES;
    }
    else {
        return NO;
    }
}

+(BOOL)isValidateString:(NSString *)myString
{
    NSCharacterSet *nameCharacters = [[NSCharacterSet characterSetWithCharactersInString:@"$_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"] invertedSet];
    NSRange userNameRange = [myString rangeOfCharacterFromSet:nameCharacters];
    if (userNameRange.location != NSNotFound) {
        //NSLog(@"包含特殊字符");
        return FALSE;
    }else{
        return TRUE;
    }
    
}

+ (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    if(string.length == 11 ){
        
        return [scan scanInt:&val] && [scan isAtEnd];
    }else{
        return NO;
    }

}
+ (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRST";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+ (NSString *)getIDFV
{
    NSString *idfv = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    return idfv;
}

+(NSString *)reviseString:(NSString *)string{
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];
    NSString *doubleString        = [NSString stringWithFormat:@"%lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}
+ (void)countdownTimeByDuration:(NSInteger)duration start:(void (^)(NSInteger timeOut))startBlock end:(void (^)(void))endBlock
{
    //获取验证码
    __block NSInteger timeout = duration; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                endBlock();

            });
        }else{
            NSInteger seconds = timeout % 60;
//            NSString *strTime = [NSString stringWithFormat:@"%.2ds后重新发送", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                startBlock(seconds);

                
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}
@end
