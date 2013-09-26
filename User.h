//
//  User.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CloudMine/CloudMine.h>

@interface User : CMObject
{
    NSString *_userName;
    NSString *_name;
    NSString *_userAddress;
    NSString *_userPhone;
}
@end
