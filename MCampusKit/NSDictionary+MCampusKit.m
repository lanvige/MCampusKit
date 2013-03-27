//
//  NSDictionary+MCampusKit.m
//  MCampusKit
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "NSDictionary+MCampusKit.h"

@implementation NSDictionary (MCampusKit)

- (id)safeObjectForKey:(id)key
{
    id value = [self objectForKey:key];
    if (value == [NSNull null]) {
        return nil;
    }
    return value;
}

@end
