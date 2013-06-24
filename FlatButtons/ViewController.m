//
//  ViewController.m
//  FlatButtons
//
//  Created by JASON EVERETT on 6/22/13.
//  Copyright (c) 2013 JASON EVERETT. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "FlatButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    FlatButton *tileBtn = [[FlatButton alloc] initWithFrame:CGRectMake(10,10,148,100) withBackgroundColor:[UIColor grayColor]];
    [tileBtn setTitle:@"Tile Button" forState:UIControlStateNormal];
    tileBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:tileBtn];
    
    FlatButton *tileBtn2 = [[FlatButton alloc] initWithFrame:CGRectMake(165,10,148,100) withBackgroundColor:[UIColor darkGrayColor]];
    [tileBtn2 setTitle:@"Tile Button 2" forState:UIControlStateNormal];
    tileBtn2.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:tileBtn2];
    
    FlatButton *blackBtn = [[FlatButton alloc] initWithFrame:CGRectMake(10,125,148,44) withBackgroundColor:[UIColor blackColor]];
    [blackBtn setTitle:@"Black Button" forState:UIControlStateNormal];
    blackBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:blackBtn];
    
    FlatButton *redBtn = [[FlatButton alloc] initWithFrame:CGRectMake(165,125,148,44) withBackgroundColor:[UIColor colorWithRed:216/255.0 green:26/255.0 blue:0 alpha:1]];
    [redBtn setTitle:@"Red Button" forState:UIControlStateNormal];
    redBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:redBtn];

    FlatButton *blueBtn = [[FlatButton alloc] initWithFrame:CGRectMake(10,175,148,44) withBackgroundColor:[UIColor colorWithRed:135/255.0 green:180/255.0 blue:246/255.0 alpha:1]];
    [blueBtn setTitle:@"Blue Button" forState:UIControlStateNormal];
    blueBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:blueBtn];
    
    FlatButton *greenBtn = [[FlatButton alloc] initWithFrame:CGRectMake(165,175,148,44) withBackgroundColor:[UIColor colorWithRed:0.521569 green:0.768627 blue:0.254902 alpha:1]];
    [greenBtn setTitle:@"Green Button" forState:UIControlStateNormal];
    greenBtn.titleLabel.font = [UIFont fontWithName:@"Avenir-Black" size:20.0f];
    [self.view addSubview:greenBtn];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
