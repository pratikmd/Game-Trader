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

-(id)initWithNames:(NSString *)name type:(NSString *)type price:(NSString *)price username:(NSString *)userName
{
    self = [super init];
    _userName = userName;
    _name = name;
    _type = type;
    _expectedPrice = price;
    return self;
}

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

-(NSString *)getUser
{
    return _userName;
}

-(NSString *)getName
{
    return _name;
}

-(NSString *)getCost
{
    return _expectedPrice;
}

@end
