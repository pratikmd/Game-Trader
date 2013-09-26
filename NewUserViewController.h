//
//  NewUserViewController.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUserViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordLabel2;
@property (weak, nonatomic) IBOutlet UITextField *streetAddressLabel;
@property (weak, nonatomic) IBOutlet UITextField *address2Label;
@property (weak, nonatomic) IBOutlet UITextField *cityLabel;
@property (weak, nonatomic) IBOutlet UITextField *stateLabel;
@property (weak, nonatomic) IBOutlet UITextField *zipLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneLabel;

- (IBAction)doneButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end
