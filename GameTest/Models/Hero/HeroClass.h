//
//  HeroClass.h
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeroClass : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic, assign)NSInteger gender;
@property (nonatomic, assign)float HP;
@property (nonatomic, assign)float MP;
@property (nonatomic, assign)float Level;
@property (nonatomic, assign)float ATT;
@property (nonatomic, assign)float Den;
@property (nonatomic, assign)float Speed;
@property (nonatomic, assign)NSInteger Skill;
@property (nonatomic, strong)SKSpriteNode *spriteNode;
@property (nonatomic, strong)NSArray *idleFarams;
@property (nonatomic, strong)NSArray *walkFarams;

- (void)idle;

- (void)walk;

- (void)levelUp;


@end

NS_ASSUME_NONNULL_END
