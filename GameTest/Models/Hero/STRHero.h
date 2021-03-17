//
//  STRHero.h
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "HeroClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface STRHero : HeroClass

- (STRHero *)initHeroWithName:(NSString *)name andGender:(NSInteger)gender;

- (void)idle;

- (void)walk;

- (void)levelUp;

@end

NS_ASSUME_NONNULL_END
