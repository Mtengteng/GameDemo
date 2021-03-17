//
//  INTHero.m
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "INTHero.h"

@implementation INTHero

- (instancetype)initHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    if (self = [super init]) {
        
        self.name = name;
        self.gender = gender;
        self.HP = 60.0;
        self.MP = 120.0;
        self.Level = 1.0;
        self.ATT = 15.0;
        self.Den = 5.0;
        self.Speed = 0.5;
        self.Skill = 3;
        
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
