//
//  ListStore.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Listing.h"
#import "User.h"

@interface ListStore : NSObject
{
    NSMutableArray *_listStore;
}
-(void) addNewListObject:(Listing *)listing;
+(ListStore *)Store;
@end
