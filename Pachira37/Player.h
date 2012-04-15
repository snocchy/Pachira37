//
//  Player.h
//  Pachira37
//
//  Created by  on 12/04/09.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
{
    // 先攻か後攻か とりあえずBOOLで
    BOOL _isFirstMove;
    
    
    // このへん仮
    int _rating;
    int _winCount;
    int _loseCount;
    
}

@end
