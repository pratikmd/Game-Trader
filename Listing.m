//
//  Listing.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "Listing.h"

@implementation Listing

NSString *ktypekey = @"typeKey";
NSString *knamekey = @"nameKey";
NSString *kexpectedPriceKey = @"expectedPriceKey";
NSString *kuserNameKey = @"userNameKey";

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_type forKey:ktypekey];
    [aCoder encodeObject:_name forKey:knamekey];
    [aCoder encodeObject:_expectedPrice forKey:kexpectedPriceKey];
    [aCoder encodeObject:_userName forKey:kuserNameKey];
}

- (id)initWithCoder:(NSCoder *)aCoder {
    if ((self = [super initWithCoder:aCoder])) {
        _type = [aCoder decodeObjectForKey:ktypekey];
        _name = [aCoder decodeObjectForKey:knamekey];
        _expectedPrice = [aCoder decodeObjectForKey:kexpectedPriceKey];
        _userName = [aCoder decodeObjectForKey:kuserNameKey];
    }
    return self;
}

@end