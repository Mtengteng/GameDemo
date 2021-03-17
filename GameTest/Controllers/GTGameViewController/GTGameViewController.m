//
//  GTGameViewController.m
//  GameTest
//
//  Created by 马腾 on 2019/3/15.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "GTGameViewController.h"
#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>
#import "STRHero.h"
#import "Monster.h"
#import "GTCreateHero.h"
#import "GTGameScene.h"

@interface GTGameViewController ()
@property (nonatomic, strong)GTGameScene *scene;
@property (nonatomic, strong)SKView *skView;

@end

@implementation GTGameViewController

- (GTGameScene *)scene
{
    if (!_scene) {
        _scene = [[GTGameScene alloc] initWithSize:self.view.bounds.size];
        _scene.scaleMode = SKSceneScaleModeAspectFit;
    }
    return _scene;
}
- (SKView *)skView
{
    if (!_skView) {
        _skView = [[SKView alloc] initWithFrame:self.view.bounds];
        _skView.showsFPS = YES;
        _skView.showsNodeCount = YES;
        [_skView presentScene:self.scene];

    }
    return _skView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.skView];
    
    STRHero *hero = [GTCreateHero createSTRHeroWithName:@"ma" andGender:1];
    hero.spriteNode.position = CGPointMake(CGRectGetMidX(self.skView.frame), CGRectGetMidY(self.skView.frame));
    [self.scene addChild:hero.spriteNode];
    [hero idle];

    self.scene.hero = hero;
    
    Monster *monster = [GTCreateHero createMonster];
    monster.spriteNode.position = CGPointMake(300,300);
    [self.scene addChild:monster.spriteNode];
    [monster idle];
//    [monster attackWithHero:hero];
    
    self.scene.monster = monster;
    
    
}


@end
