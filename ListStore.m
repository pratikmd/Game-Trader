//
//  ListStore.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/29/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "ListStore.h"

static ListStore *shared;

@implementation ListStore
+(ListStore *) Store
{
    if(!shared)
        shared = [[ListStore alloc] init];
    return shared;
}

-(void) addNewListObject:(Listing *)listing
{
    [_listStore addObject:listing];
}
@end
