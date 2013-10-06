//
//  GameDetailViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 10/5/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "GameDetailViewController.h"

@interface GameDetailViewController ()

@end

@implementation GameDetailViewController
@synthesize listing;
@synthesize gameImage;
@synthesize gameNameLabel;
@synthesize userNameLabel;
@synthesize costLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    gameNameLabel.text = listing.getName;
    [gameNameLabel setTextAlignment:NSTextAlignmentCenter];
    gameNameLabel.font = [UIFont systemFontOfSize:35];
    userNameLabel.text = listing.getUser;
    costLabel.text = listing.getCost;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
