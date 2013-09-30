//
//  ListStore.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudMine/CloudMine.h>
#import "Listing.h"
#import "User.h"

@interface ListStore : NSObject
{
    NSMutableArray *_listStore;
    CMUser *_currentUser;
}

+(ListStore *)Store;

-(void) addNewListObject:(Listing *)listing;
-(void)setUser:(CMUser *)user;
-(CMUser *)getUser;
-(int)getCount;

@end
