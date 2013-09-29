//
//  NewUserViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "NewUserViewController.h"
#import <CloudMine/CloudMine.h>
@interface NewUserViewController ()

@end

@implementation NewUserViewController

@synthesize nameLabel;
@synthesize userNameLabel;
@synthesize passwordLabel;
@synthesize passwordLabel2;
@synthesize streetAddressLabel;
@synthesize address2Label;
@synthesize cityLabel;
@synthesize stateLabel;
@synthesize zipLabel;
@synthesize phoneLabel;

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
    passwordLabel.secureTextEntry = YES;
    passwordLabel2.secureTextEntry = YES;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonPressed:(id)sender {
    if([self parametersAreValid])
    {
        CMUser *user = [[CMUser alloc] initWithUsername:userNameLabel.text andPassword:passwordLabel.text];
    [user createAccountWithCallback:^(CMUserAccountResult resultCode, NSArray *messages) {
        switch(resultCode) { //TODO:Complete enumerated values
            case CMUserAccountCreateSucceeded:
            {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Account Created !" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [alert show];
            }
                break;
            case CMUserAccountCreateFailedInvalidRequest:
                // invalid request. examine messages
                break;
            case CMUserAccountCreateFailedDuplicateAccount:
                // this account already exists
                break;
        }
    }];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[self view] endEditing:TRUE];
    
}

-(BOOL)parametersAreValid
{
    if(![passwordLabel.text isEqualToString:passwordLabel2.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Passwords dont match." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(nameLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(userNameLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a username." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(streetAddressLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a street address." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(cityLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a city name." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(stateLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a state." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(zipLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a zipcode." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    if(phoneLabel.text.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please enter a phone number." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return FALSE;
    }
    return YES;
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
