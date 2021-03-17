//
//  DEXHero.m
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "DEXHero.h"

@implementation DEXHero

- (instancetype)initHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    if (self = [super init]) {

        self.name = name;
        self.gender = gender;
        self.HP = 80.0;
        self.MP = 80.0;
        self.Level = 1.0;
        self.ATT = 12.0;
        self.Den = 8.0;
        self.Speed = 0.9;
        self.Skill = 1;
        
    }
    return self;
}

- (void)levelUp
{
    
}
- (void)idle
{
    
}
- (void)walk
{
    
}

@end
