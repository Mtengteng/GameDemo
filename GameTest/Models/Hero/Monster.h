//
//  Monster.h
//  GameTest
//
//  Created by 马腾 on 2019/3/18.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "HeroClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Monster : HeroClass

- (instancetype)initMonster;

- (void)idle;

- (void)walk;

- (void)attackWithHero:(HeroClass *)hero;

@end

NS_ASSUME_NONNULL_END
