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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    TURN_X = @"X";
    TURN_O = @"O";
    currentTurn = TURN_X;
    [self createButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createLabel{
    /*turnLabel = [[UILabel alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];*/
}

- (void) createButtons{
    char x = 0;
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

- (void) buttonPressed: (id)sender{
    UIButton* button = (UIButton*)sender;
    
    if([[button currentTitle] isEqualToString:@""]){
        [button setTitle:currentTurn forState:UIControlStateNormal];
        currentTurn = [currentTurn isEqualToString:TURN_X] ? TURN_O:TURN_X;
        //[self checkForWin]
    }
}

@end
