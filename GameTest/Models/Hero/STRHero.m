//
//  STRHero.m
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "STRHero.h"

@implementation STRHero

- (STRHero *)initHeroWithName:(NSString *)name andGender:(NSInteger)gender
{
    if (self = [super init]) {
        
        SKTexture *texture = [SKTexture textureWithImageNamed:@"hero"];
        
//        self.spriteNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(80, 80)];

        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:texture size:CGSizeMake(80, 80)];
        self.name = name;
        self.gender = gender;
        self.HP = 100.0;
        self.MP = 50.0;
        self.Level = 1.0;
        self.ATT = 10.0;
        self.Den = 10.0;
        self.Speed = 0.7;
        self.Skill = 0;
        
//        SKTextureAtlas *textureAtlas = [SKTextureAtlas atlasNamed:@"Goblin_Idle"];
//        NSMutableArray *idleFarams = [NSMutableArray array];
//        for(NSInteger i = 1; i < textureAtlas.textureNames.count; i++){
//            SKTexture *texture = [textureAtlas textureNamed:[NSString stringWithFormat:@"goblin_idle_%04zd",i]];
//            [idleFarams addObject:texture];
//        }
//
//        self.idleFarams = idleFarams.copy;
//
//        SKTextureAtlas *textureWalkAtlas = [SKTextureAtlas atlasNamed:@"Goblin_Walk"];
//        NSMutableArray *walkFarams = [NSMutableArray array];
//        for(NSInteger i = 1; i < textureWalkAtlas.textureNames.count; i++){
//            SKTexture *textureWalk = [textureWalkAtlas textureNamed:[NSString stringWithFormat:@"goblin_walk_%04zd",i]];
//            [walkFarams addObject:textureWalk];
//        }
//
//        self.walkFarams = walkFarams.copy;
        
    }
    return self;
}

- (void)levelUp
{
    
}
- (void)idle
{
//    SKAction *run = [SKAction animateWithTextures:self.idleFarams timePerFrame:0.05];
//    [self.spriteNode runAction:[SKAction repeatActionForever:run]];
}
- (void)walk
{
//    SKAction *run = [SKAction animateWithTextures:self.walkFarams timePerFrame:0.05];
//    [self.spriteNode runAction:[SKAction repeatActionForever:run]];
}

@end
