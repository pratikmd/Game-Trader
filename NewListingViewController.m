//
//  NewListingViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "NewListingViewController.h"
#import "ListStore.h"

@interface NewListingViewController ()

@end

@implementation NewListingViewController
@synthesize nameLabel;
@synthesize priceLabel;
@synthesize picker;
@synthesize typeLabel;

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
    _dataArray = [[NSArray alloc] initWithObjects:@"Loan",@"Sale", nil];
    typeLabel.inputView = picker;
    picker.hidden = YES;
    picker.delegate = self;
    picker.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return 2;
    
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [_dataArray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    typeLabel.text = [_dataArray objectAtIndex:row];
}

- (IBAction)addImageButtonPressed:(id)sender {
    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
    imgPicker.delegate = self;
    imgPicker.sourceType = UIImagePickerControllerCameraCaptureModePhoto;
    
    [self presentViewController:imgPicker animated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonPressed:(id)sender {
}
@end
