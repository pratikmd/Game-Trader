//
//  ListingViewController.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "ListingViewController.h"
#import "ListStore.h"
#import "Listing.h"
#import "NewListingViewController.h"
#import "GameDetailViewController.h"
#import <CloudMine/CloudMine.h>

@interface ListingViewController ()

@end

@implementation ListingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewListing)];
    UIBarButtonItem *logoutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logoutUser)];
    self.navigationItem.rightBarButtonItem = logoutButton;
    self.navigationItem.leftBarButtonItem = addButton;
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    [refreshControl addTarget:self action:@selector(refreshListing)forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    [self refreshListing];
        // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)refreshListing
{
    CMStore *store = [CMStore defaultStore];
    [store allObjectsOfClass:[Listing class] additionalOptions:nil callback:^(CMObjectFetchResponse *response) {
        NSArray *listings = response.objects;
        _arrayOfLists = [listings mutableCopy];
        [self getImage];
    }];
}

-(void)getImage
{
//    CMStore *store;
//
//    [store fileWithName:@"kitten.jpg" additionalOptions:nil callback:^(CMFileFetchResponse *response) {
//        NSData *imageData = response.file.fileData;
//        
//        // do something with the data..
//    }];
    [self reloadTable];
}

-(void)reloadTable
{
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _arrayOfLists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    Listing *listing = [_arrayOfLists objectAtIndex:indexPath.row];
    cell.textLabel.text = listing.getName;
    cell.detailTextLabel.text = listing.getCost;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    GameDetailViewController *detailViewController = [[GameDetailViewController alloc] init];

    // Pass the selected object to the new view controller.
    
    detailViewController.listing = [_arrayOfLists objectAtIndex:indexPath.row];
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 


-(void)addNewListing
{
    NewListingViewController *viewController = [[NewListingViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

-(void)logoutUser
{
    CMUser *user = [[ListStore Store] getUser];
    [user logoutWithCallback:^(CMUserAccountResult resultCode, NSArray *messages) {
        // check result status
        switch(resultCode) {
            case CMUserAccountLogoutSucceeded:
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
                break;
            case CMUserAccountOperationFailedUnknownAccount:
                // unknown account error
                break;
        }
    }];
}

@end
