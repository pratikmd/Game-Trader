//
//  GameDetailViewController.h
//  GameTrader
//
//  Created by Desai, Pratik on 10/5/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listing.h"

@interface GameDetailViewController : UIViewController
@property Listing *listing;
@property (weak, nonatomic) IBOutlet UILabel *gameNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *costLabel;
@property (weak, nonatomic) IBOutlet UIImageView *gameImage;
@end
