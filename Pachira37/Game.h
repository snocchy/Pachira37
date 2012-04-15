//
//  CurlingGame.h
//  Pachira37
//
//  Created by  on 12/04/15.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Game : NSObject
{
    Player* _player1;
    Player* _player2;
    
    NSArray* _ends;
    
    
}
@end
