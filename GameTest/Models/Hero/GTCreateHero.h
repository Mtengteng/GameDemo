//
//  GTCreateHero.h
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class STRHero;
@class DEXHero;
@class INTHero;
@class Monster;

@interface GTCreateHero : NSObject

+ (STRHero *)createSTRHeroWithName:(NSString *)name andGender:(NSInteger)gender;

+ (DEXHero *)createDEXHeroWithName:(NSString *)name andGender:(NSInteger)gender;

+ (INTHero *)createINTHeroWithName:(NSString *)name andGender:(NSInteger)gender;

+ (Monster *)createMonster;

@end

NS_ASSUME_NONNULL_END
