//
//  NewListingViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "NewListingViewController.h"
#import "ListStore.h"
#import "Listing.h"

@interface NewListingViewController ()

@end

@implementation NewListingViewController
@synthesize nameLabel;
@synthesize priceLabel;
@synthesize picker;
@synthesize typeLabel;
@synthesize listingImage;

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:TRUE];
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
    picker.hidden = YES;
}

- (IBAction)typeTextFieldDidStartEditing:(id)sender {
    picker.hidden = NO;
}
- (void) imagePickerController: (UIImagePickerController *) picker
 didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
 //   NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    _originalImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    listingImage.image = _originalImage;
    [_imgPicker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addImageButtonPressed:(id)sender { //TODO : Test this on the device
    _imgPicker = [[UIImagePickerController alloc] init];
    _imgPicker.delegate = self;
    _imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:_imgPicker animated:YES completion:nil];
}

- (IBAction)cancelButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButtonPressed:(id)sender { //TODO : add alerts
    CMStore *store = [CMStore defaultStore];
    CMUser *currentUser = [[ListStore Store] getUser];
    NSString *userName = currentUser.email;
    Listing *listing = [[Listing alloc] initWithNames:nameLabel.text type:typeLabel.text price:priceLabel.text username:userName];
    if([self parametersChecked])
    {
        if(_originalImage != nil)
        {
            NSData *imageData = UIImagePNGRepresentation(_originalImage);
            [store saveFileWithData:imageData named:[NSString stringWithFormat:@"%@:%@",userName,nameLabel] additionalOptions:nil callback:^(CMFileUploadResponse *response) {
                switch(response.result) {
                    case CMFileCreated:
                    // the file was created, do something with it
                    break;
                    case CMFileUpdated:
                    // the file was updated, do something with it
                    break;
                    case CMFileUploadFailed:
                    // upload failed!
                    break;
                }
            [self uploadListing:listing];
            }];
        }
        else
            [self uploadListing:listing];
    }
}

-(void) uploadListing:(Listing *)listing
{
    [listing save:^(CMObjectUploadResponse *response) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (BOOL)parametersChecked
{
    if(priceLabel.text.length == 0 || typeLabel.text.length == 0 || nameLabel.text.length == 0 )
        return NO;
    return YES;
}
@end
