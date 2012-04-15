//
//  Stone.m
//  Pachira37
//
//  Created by  on 12/03/22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Stone.h"
#import "Rink.h"
#import "math.h"

// private methods
@interface Stone()

- (void)calcHitting:(Stone *)stone;

- (CGFloat)distanceTo:(Stone *)stone;

- (BOOL)isHitting:(Stone *) stone;

- (void)stateCheck;
- (void)movingCheck;
- (void)activeCheck;
- (BOOL)isOutsideRink;

@end

@implementation Stone

@synthesize rink;

@synthesize posX = _posX;
@synthesize posY = _posY;

@synthesize speed = _speed;
@synthesize direction = _direction;

// Stoneの半径(数値は適当)
static const CGFloat RADIUS = 30;

static const CGFloat PI = (CGFloat) M_PI;

static const CGFloat LOWEST_SPEED = 0.001;

- (void)dealloc {
    [super dealloc];
}

// setter,getter

- (BOOL)isActive{
    return _active;
}
- (void)setActive:(BOOL)active {
    // 非アクティブのときは必ずisMovingもNOに
    _active = active;
    if (! active) {
        if(self.moving){
            self.moving = NO;
            [self.rink notifyStopping:self];
        }
        [self.rink notifyDeactive:self];
    }
}

- (BOOL)isMoving {
    return _moving;
}
- (void)setMoving:(BOOL)moving {
    if (self.active) {
        _moving = moving;
        if (! moving) {
            self.speed = NO;
            [self.rink notifyStopping:self];
        }
    }
    else {
        // ActiveでないのにMovingであることはない
        // そのような変更は拒否する
        NSLog(@"warning: setMoving is not available if !self.active");
    }
}

- (void)calcNextState {
    NSParameterAssert(self.isActive);
    
    //衝突の検査対象
    //自分がmovingならactive全体、そうでないならmovingのみでよい
    NSArray* stones = self.isMoving? self.rink.activeStones : self.rink.movingStones;
    
    for (Stone* stone in stones) {
        if([self isHitting:stone]){
            [self calcHitting:stone];
        }
    }
    
}

- (void)updateState {
    self.posX = _nextPosX;
    self.posY = _nextPosY;
    self.direction = _nextDirection;
    self.speed = _nextSpeed;
}


#pragma mark -
#pragma mark private methods

// TODO
// nextDirection,nextSpeedを決定する
- (void)calcHitting:(Stone *)stone {
    NSParameterAssert([self isHitting:stone]);
}

// 中心距離
- (CGFloat)distanceTo:(Stone *)stone {
    return [Rink distanceOf:self to:stone];
}

// 衝突判定
- (BOOL)isHitting:(Stone *) stone {
    if ([self distanceTo:stone] <= RADIUS * 2) {
        return YES; 
    }
    return NO;
}

- (void)stateCheck {
    if (self.moving) {
        [self movingCheck];
        [self activeCheck];
    }
}

- (void)movingCheck {
    // speedが閾値より低い時
    if(self.speed <= LOWEST_SPEED){
        self.speed = 0;
        self.moving = NO;
    }
}

- (void)activeCheck {
    // posX,posYが場外
    if([self isOutsideRink]){
        self.active = NO;
    }
}
        
- (BOOL)isOutsideRink {
    // TODO
    return NO;
}


@end
