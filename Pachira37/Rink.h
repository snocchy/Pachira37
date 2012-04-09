//
//  Rink.h
//  Curling
//
//  Created by  on 12/03/22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoneDelegate.h"
#import "Stone.h"

@interface Rink : NSObject <StoneDelegate>
{
    NSMutableArray* _stones;
    NSMutableArray* _activeStones;
    NSMutableArray* _movingStones;
}

@property(nonatomic, readonly, retain) NSMutableArray* stones;
@property(nonatomic, readonly, retain) NSMutableArray* activeStones;
@property(nonatomic, readonly, retain) NSMutableArray* movingStones;

- (void)calcNext;

+ (CGFloat)distanceOf:(Stone*)stone1 to:(Stone *)stone2;

- (CGFloat)fliction:(CGFloat)posX:(CGFloat)posY;

- (void)notifyDeactive:(Stone*)stone;
- (void)notifyStopping:(Stone*)stone;

@end
