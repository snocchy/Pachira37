//
//  Stone.h
//  Curling
//
//  Created by  on 12/03/22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoneDelegate.h"
@class Rink;
#import "Player.h"

@interface Stone : NSObject
{
    // 所持プレイヤー

    Player* _player;
    
    //id<StoneDelegate> _delegate;
    CGFloat _posX, _posY;
    
    BOOL _active;
    BOOL _moving;
    
    CGFloat _speed;
    CGFloat _direction; //radian
    
    
    CGFloat _nextPosX, _nextPosY;
    CGFloat _nextSpeed;
    CGFloat _nextDirection;
    

}

//@property(nonatomic, assign) id<StoneDelegate> delegate;
@property(nonatomic, assign) Rink* rink;

@property(nonatomic) CGFloat posX, posY;

@property(nonatomic, getter=isActive) BOOL active;
@property(nonatomic, getter=isMoving) BOOL moving;

@property(nonatomic) CGFloat speed;
@property(nonatomic) CGFloat direction;


- (void)calcNextState;
- (void)updateState;


// privateに変更
//- (BOOL)isHitting:(Stone *)stone;
//- (CGFloat)distanceTo:(Stone *)stone;

@end
