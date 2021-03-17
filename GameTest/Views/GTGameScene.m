//
//  GTGameScene.m
//  GameTest
//
//  Created by 马腾 on 2019/3/18.
//  Copyright © 2019 beiwaionline. All rights reserved.
//

#import "GTGameScene.h"
#import "HSKJoystick.h"



@interface GTGameScene() <HSKJoystickDelegate>{
    BOOL _isJoystickTouchEnded;
    HSKJoystick *_joystick;
    
}
@end

@implementation GTGameScene

- (void)didMoveToView:(SKView *)view {
    
    _isJoystickTouchEnded = YES;
    
    HSKJoystick *joystick = [HSKJoystick joystickWithBackdropImageNamed:@"dpad" thumbImageNamed:@"joystick" thumbSize:CGSizeMake(60, 60) size:CGSizeMake(120, 120)];
    joystick.position = CGPointMake(100, 100);
    joystick.delegate = self;
    _joystick = joystick;
    [self addChild:joystick];
    
   HSKJoystick *attjoystick = [[HSKJoystick alloc] initWithAttackButtonImageNamed:@"att" size:CGSizeMake(100, 100)];
    attjoystick.position = CGPointMake(SCREEN_WIDTH - 120, 100);
    [self addChild:attjoystick];
    
    
}

#pragma mark-
#pragma mark- JoystickDelegate
- (void)joystick:(HSKJoystick *)joystick touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    _hero.spriteNode.zRotation = joystick.rotateAngle;
    
    if(_isJoystickTouchEnded){
        [_hero walk];
        _isJoystickTouchEnded = NO;
    }
    DefineWeakSelf;
    if(CGPointEqualToPoint(joystick.velocity, CGPointMake(0, 0))){
        joystick.trackingHandler = ^(){
            
            SKAction *move = [SKAction moveTo:CGPointMake(weakSelf.hero.spriteNode.position.x + (self->_joystick.velocity.x*0.2 * weakSelf.hero.Speed), weakSelf.hero.spriteNode.position.y + (self->_joystick.velocity.y*0.2 * weakSelf.hero.Speed)) duration:0.1];
            
            [weakSelf.hero.spriteNode runAction:move];
            
//            [weakSelf.monster attackWithHero:weakSelf.hero];

           
            
          
        };
    }
}

- (void)joystick:(HSKJoystick *)joystick touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    _isJoystickTouchEnded = YES;;
    [_hero idle];
}
@end
