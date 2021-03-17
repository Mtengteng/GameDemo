//
//  INTHero.h
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "HeroClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface INTHero : HeroClass

- (instancetype)initHeroWithName:(NSString *)name andGender:(NSInteger)gender;

- (void)idle;

- (void)walk;

- (void)levelUp;

@end

NS_ASSUME_NONNULL_END
