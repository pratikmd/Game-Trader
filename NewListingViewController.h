//
//  NewListingViewController.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewListingViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    NSArray *_dataArray;
    UIImagePickerController *_imgPicker;
    UIImage *_originalImage;
}

@property (weak, nonatomic) IBOutlet UITextField *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *listingImage;
- (IBAction)typeTextFieldDidStartEditing:(id)sender;
- (IBAction)addImageButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end
