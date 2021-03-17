//
//  GTCreateHero.m
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "GTCreateHero.h"
#import "STRHero.h"
#import "DEXHero.h"
#import "INTHero.h"
#import "Monster.h"


@implementation GTCreateHero

+ (STRHero *)createSTRHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    return [[STRHero alloc] initHeroWithName:name andGender:gender];
}
+ (DEXHero *)createDEXHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    return [[DEXHero alloc] initHeroWithName:name andGender:gender];
}
+ (INTHero *)createINTHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    return [[INTHero alloc] initHeroWithName:name andGender:gender];
}
+ (Monster *)createMonster
{
    return [[Monster alloc] initMonster];
}

@end
