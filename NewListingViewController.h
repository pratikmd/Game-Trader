//
//  NewListingViewController.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewListingViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSArray *_dataArray;
}

@property (weak, nonatomic) IBOutlet UIPickerView *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *priceLabel;
@property (weak, nonatomic) IBOutlet UITextField *typeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *listingImage;

- (IBAction)addImageButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
- (IBAction)doneButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@end
