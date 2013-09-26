//
//  User.m
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import "User.h"

@implementation User

NSString *kusernameKey = @"userNameKey";
NSString *knameKey = @"nameKey";
NSString *kuserAddressKey = @"userAddressKey";
NSString *kuserPhoneKey = @"userPhoneKey";

-(void) encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:_userName forKey:kusernameKey];
    [aCoder encodeObject:_name forKey:knameKey];
    [aCoder encodeObject:_userAddress forKey:kuserAddressKey];
    [aCoder encodeObject:_userPhone forKey:kuserPhoneKey];
}

- (id)initWithCoder:(NSCoder *)aCoder {
    if ((self = [super initWithCoder:aCoder])) {
        _userName = [aCoder decodeObjectForKey:kusernameKey];
        _name = [aCoder decodeObjectForKey:knameKey];
        _userAddress = [aCoder decodeObjectForKey:kuserAddressKey];
        _userPhone = [aCoder decodeObjectForKey:kuserPhoneKey];
    }
    return self;
}

@end
