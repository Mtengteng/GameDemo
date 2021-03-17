//
//  Monster.m
//  GameTest
//
//  Created by 马腾 on 2019/3/18.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "Monster.h"

@implementation Monster

- (instancetype)initMonster
{
    if (self = [super init]) {
        
        SKTexture *texture = [SKTexture textureWithImageNamed:@"goblin_idle_0001"];
        
        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:texture size:CGSizeMake(80, 80)];
//        self.spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(80, 80)];
        
        self.HP = 50.0;
        self.MP = 50.0;
        self.Level = 1.0;
        self.ATT = 5.0;
        self.Den = 2.0;
        self.Speed = 0.5;
        self.Skill = 0;
        
        SKTextureAtlas *textureAtlas = [SKTextureAtlas atlasNamed:@"Goblin_Idle"];
        NSMutableArray *idleFarams = [NSMutableArray array];
        for(NSInteger i = 1; i < textureAtlas.textureNames.count; i++){
            SKTexture *texture = [textureAtlas textureNamed:[NSString stringWithFormat:@"goblin_idle_%04zd",i]];
            [idleFarams addObject:texture];
        }
        
        self.idleFarams = idleFarams.copy;
        
        SKTextureAtlas *textureWalkAtlas = [SKTextureAtlas atlasNamed:@"Goblin_Walk"];
        NSMutableArray *walkFarams = [NSMutableArray array];
        for(NSInteger i = 1; i < textureWalkAtlas.textureNames.count; i++){
            SKTexture *textureWalk = [textureWalkAtlas textureNamed:[NSString stringWithFormat:@"goblin_walk_%04zd",i]];
            [walkFarams addObject:textureWalk];
        }
        
        self.walkFarams = walkFarams.copy;
        
    }
    return self;
}

- (void)levelUp
{
    
}
- (void)idle
{
    SKAction *run = [SKAction animateWithTextures:self.idleFarams timePerFrame:0.05];
    [self.spriteNode runAction:[SKAction repeatActionForever:run]];
}
- (void)walk
{
    SKAction *run = [SKAction animateWithTextures:self.walkFarams timePerFrame:0.05];
    [self.spriteNode runAction:[SKAction repeatActionForever:run]];
}
- (void)attackWithHero:(HeroClass *)hero
{
    SKAction *actionMove = [SKAction moveTo:CGPointMake(hero.spriteNode.position.x,hero.spriteNode.position.y)
                                   duration:1];
    SKAction *actionMoveDone = [SKAction runBlock:^{
        //        [enemy removeFromParent];
        //        [self.enemys removeObject:enemy];
        
    }];
    [self.spriteNode runAction:[SKAction repeatActionForever:actionMove]];


}
@end
