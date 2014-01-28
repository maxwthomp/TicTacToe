//
//  ViewController.m
//  TicTacToeNew
//
//  Created by SHDHS Student on 1/21/2014.
//  Copyright (c) 2014 SHDHS Student. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController
//intialize variables

//Initlize v
- (void)viewDidLoad
{
    [super viewDidLoad];
    TURN_X = @"X";
    TURN_O = @"O";
    currentTurn = TURN_X;
    [self createButtons];
    [self createLabel];
}
// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
//Create the label
- (void) createLabel{
    turnLabel = [[UILabel alloc] initWithFrame:CGRectMake(400, 400, 200, 200)];
    turnLabel.text = currentTurn;
    turnLabel.font = [UIFont fontWithName:@"Airal" size:12];
    turnLabel.numberOfLines = 1;
    turnLabel.textColor = [UIColor blackColor];
    [self.view addSubview:turnLabel];
}
//Create all the buttons to use as the tic tac toe board
- (void) createButtons{
    char x = 100;
    char xOffset = 100;
    char y = 0;
    char yOffset = 100;
    char w = 100;
    char h = 100;
    for(y = 0; y < 3; y++){
        for(x = 0; x < 3; x++){
            bArr[y][x] = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            bArr[y][x].frame = CGRectMake(x*w+xOffset+x, y*h+yOffset+y, w, h);
            bArr[y][x].backgroundColor = [UIColor lightGrayColor];
            [bArr[y][x] setTitle:@"" forState:UIControlStateNormal];
            [bArr[y][x] addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:bArr[y][x]];
        }
    }
}
//what happens if any one button is clicked
- (void) buttonPressed: (id)sender{
    UIButton* button = (UIButton*)sender;
    
    if([[button currentTitle] isEqualToString:@""]){
        [button setTitle:currentTurn forState:UIControlStateNormal];
        currentTurn = [currentTurn isEqualToString:TURN_X] ? TURN_O:TURN_X;
        turnLabel.text = currentTurn;
        [self checkForWin];
    }
}
//checks to see if there is a wi
-(void) checkForWin{
    char n, x, y, limit = 0;
    for(n = 0;n<3;n++){
        if([bArr[n][0] currentTitle]==[bArr[n][1] currentTitle] && [bArr[n][0] currentTitle]==[bArr[n][2] currentTitle] && ![[bArr[n][0] currentTitle] isEqualToString:@""]){
            [self changeLabelForWin];
        }
        if([bArr[0][n] currentTitle]==[bArr[1][n] currentTitle] && [bArr[0][n] currentTitle]==[bArr[2][n] currentTitle] && ![[bArr[0][n] currentTitle] isEqualToString:@""]){
            [self changeLabelForWin];
        }
    }
    if([bArr[0][0] currentTitle]==[bArr[1][1] currentTitle] && [bArr[0][0] currentTitle]==[bArr[2][2] currentTitle] && ![[bArr[0][0] currentTitle] isEqualToString:@""]){
        [self changeLabelForWin];
    }
    if([bArr[0][2] currentTitle]==[bArr[1][1] currentTitle] && [bArr[0][2] currentTitle]==[bArr[2][0] currentTitle] && ![[bArr[0][2] currentTitle] isEqualToString:@""]){
        [self changeLabelForWin];
    }
    for(x=0;x<3;x++){
        for(y=0;y<3;y++){
            if(![[bArr[y][x] currentTitle] isEqualToString:@""]){
                limit++;
                if(limit==9){
                    turnLabel.text = @"Tie";
                    [self resetGame];
                }
            }
        }
    }
}

- (char)checkWinRow:(char)r{
    return ' ';var WEAK_IMPORT_ATTRIBUTE
}

-(void) changeLabelForWin{
    if([currentTurn isEqualToString:@"X"]){
        turnLabel.text = [NSString stringWithFormat:@"O wins"];
        [self resetGame];
    }else{
        turnLabel.text = [NSString stringWithFormat:@"X wins"];
        [self resetGame];
    }
}

- (void) resetGame{
    char x = 0;
    char y = 0;
    for(y = 0; y < 3; y++){
        for(x = 0;x < 3; x++){
            [bArr[y][x] setTitle:@"" forState:UIControlStateNormal];
        }
    }
    currentTurn = TURN_X;
}


@end
