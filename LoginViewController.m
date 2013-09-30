//
//  LoginViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "LoginViewController.h"
#import "NewUserViewController.h"
#import "ListingViewController.h"
#import "ListStore.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize userNameTextField;
@synthesize passwordTextField;
@synthesize statusLabel;


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
    [statusLabel setTextColor:[UIColor redColor]];
    [statusLabel setTextAlignment:NSTextAlignmentCenter];
    passwordTextField.secureTextEntry = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoginButtonPressed:(id)sender {
    
    if([self areCredentialsValid])
    {
        CMUser *user = [[CMUser alloc] initWithUsername:[userNameTextField text] andPassword:[passwordTextField text]];
        [user loginWithCallback:^(CMUserAccountResult resultCode, NSArray *messages) {
            // check result status
            switch(resultCode) {//TODO:Complete enumerated values
                case CMUserAccountLoginSucceeded:
                {
                    [[ListStore Store] setUser:user];
                    ListingViewController *viewController = [[ListingViewController alloc] init];
                    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
                    userNameTextField.text = @"";
                    passwordTextField.text = @"";
                    [self presentViewController:navigationController animated:YES completion:nil];
                }
                    break;
                case CMUserAccountLoginFailedIncorrectCredentials:
                    statusLabel.text = @"Incorrect credentials";
                    break;
                case CMUserAccountOperationFailedUnknownAccount:
                    statusLabel.text = @"Unknown account";
                    break;
            }
        }];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

- (IBAction)NewUserButtonPressed:(id)sender {
    NewUserViewController *viewController = [[NewUserViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(BOOL)areCredentialsValid
{
    if(userNameTextField.text.length == 0
       || passwordTextField.text.length == 0)
    {
        if(userNameTextField.text.length == 0)
        {
            statusLabel.text = @"Please Enter a valid user name";
        }
        if(passwordTextField.text.length == 0)
        {
            statusLabel.text = @"Please Enter a valid password";
        }
        return NO;
    }
    return YES;
}
@end
