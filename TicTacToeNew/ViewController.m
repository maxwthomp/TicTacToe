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
    char n;
    char i;
    char limit = 0;
    for(n = 0;n<3;n++){
        if([bArr[n][0] currentTitle]==[bArr[n][1] currentTitle] && [bArr[n][0] currentTitle]==[bArr[n][2] currentTitle] && ![[bArr[n][0] currentTitle] isEqualToString:@""]){
            [self changeLabelForWin];
        }
        if([bArr[0][n] currentTitle]==[bArr[1][n] currentTitle] && [bArr[0][n] currentTitle]==[bArr[2][n] currentTitle] && ![[bArr[0][n] currentTitle] isEqualToString:@""]){
            [self changeLabelForWin];
        }
        for(i = 0;i<3;i++){
            if([[bArr[n][i] currentTitle] isEqualToString:@""]){
                limit ++;
                if(limit == 9){
                    [self resetButtons];
                }
            }
        }
    }
    if([bArr[0][0] currentTitle]==[bArr[1][1] currentTitle] && [bArr[0][0] currentTitle]==[bArr[2][2] currentTitle] && ![[bArr[0][0] currentTitle] isEqualToString:@""]){
        [self changeLabelForWin];
    }
    if([bArr[0][2] currentTitle]==[bArr[1][1] currentTitle] && [bArr[0][2] currentTitle]==[bArr[2][0] currentTitle] && ![[bArr[0][2] currentTitle] isEqualToString:@""]){
        [self changeLabelForWin];
    }
}

- (void) checkWin{
    char x, y;
    char tVal = 0;
    char diag = 0;
    char diag2 = 0;
    for(y=0;y<3;y++){
        char hVal = 0;
        char vVal = 0;
        for(x=0;x<3;x++){
            hVal += [self turnToVal:[bArr[y][x] currentTitle]];
            vVal += [self turnToVal:[bArr[x][y] currentTitle]];
            tVal += abs(hVal);
            if(abs(hVal) == 3 || abs(vVal) == 3){
                [self changeLabelForWin];
                return; //End
            }
            diag += [self turnToVal:[bArr[y][y] currentTitle]];
            diag += [self turnToVal:[bArr[2-y][2-y] currentTitle]];
        }
    }
    if(tVal == 9){
        //Tie
    } else if(diag == 3 | diag2 == 3){
        //Diag
    }
    
    
}

- (char) turnToVal: (NSString*)str{
    if([str isEqualToString:TURN_X]) return 1;
    else if([str isEqualToString:TURN_O]) return -1;
    else return 0;
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
