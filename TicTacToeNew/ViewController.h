//
//  ViewController.h
//  TicTacToeNew
//
//  Created by SHDHS Student on 1/21/2014.
//  Copyright (c) 2014 SHDHS Student. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TURN_X (@"X")
#define TURN_O (@"O")

@interface ViewController : UIViewController{
    @private
        UIButton* bArr[3][3];
        UILabel* turnLabel;
        NSString* currentTurn;
}

@end
