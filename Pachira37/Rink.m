//
//  Rink.m
//  Curling
//
//  Created by  on 12/03/22.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Rink.h"

@interface Rink()

- (void)initStones;
@end

@implementation Rink

@dynamic stones;
@dynamic activeStones;
@dynamic movingStones;

//const int 

- (id)init {
    self = [super init];
    if(self){
        
    }
    return self;
}

- (void)calcNext {
    for(Stone* activeStone in self.activeStones) {
        [activeStone calcNextState];
    }
    for(Stone* activeStone in self.activeStones) {
        [activeStone updateState];
    }
}

+ (CGFloat)distanceOf:(Stone*)stone1 to:(Stone *)stone2{
    return (CGFloat) sqrt(pow(stone1.posX - stone2.posX, 2) + pow(stone1.posY - stone2.posY, 2));
}

- (CGFloat)fliction:(CGFloat)posX :(CGFloat)posY {
    return 0;
}

- (void)notifyDeactive:(Stone *)stone {
    [self.activeStones removeObject:stone];
}
- (void)notifyStopping:(Stone *)stone {
    [self.movingStones removeObject:stone];
}

# pragma mark -
# pragma mark private methods
- (void)initStones {
    for(int i=0; i<10; i++){
        //TODO
        [self.stones addObject:[[Stone alloc] init]];
    }
}

@end
