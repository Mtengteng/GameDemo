//
//  GTGameScene.h
//  GameTest
//
//  Created by 马腾 on 2019/3/18.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "STRHero.h"
#import "Monster.h"

NS_ASSUME_NONNULL_BEGIN

@interface GTGameScene : SKScene
@property (nonatomic, strong)STRHero *hero;
@property (nonatomic, strong)Monster *monster;


@end

NS_ASSUME_NONNULL_END
