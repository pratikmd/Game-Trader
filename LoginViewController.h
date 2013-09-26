//
//  LoginViewController.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudMine/CloudMine.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)LoginButtonPressed:(id)sender;
- (IBAction)NewUserButtonPressed:(id)sender;

@end
