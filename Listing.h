//
//  Listing.h
//  GameTrader
//
//  Created by Desai, Pratik on 9/25/13.
//  Copyright (c) 2013 Desai, Pratik. All rights reserved.
//

#import <CloudMine/CloudMine.h>

@interface Listing : CMObject
{
    NSString *_type;
    NSString *_name;
    NSString *_expectedPrice;
    NSString *_userName;
}
-(id)initWithNames:(NSString *)name type:(NSString *)type price:(NSString *)price username:(NSString *)userName;
-(NSString *)getName;
-(NSString *)getUser;
-(NSString *)getCost;
@end
