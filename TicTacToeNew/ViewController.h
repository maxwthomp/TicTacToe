//
//  ViewController.h
//  TicTacToeNew
//
//  Created by SHDHS Student on 1/21/2014.
//  Copyright (c) 2014 SHDHS Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    @private
        UIButton* bArr[3][3];
        UILabel* turnLabel;
        NSString* currentTurn;
        NSString* TURN_X; //Make const?
        NSString* TURN_O; //Make const?
}

@end
