//
//  UserContext.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUserContext.h"

@implementation MCKUserContext

@synthesize name, token;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];
    if (self) {
        self.mId = [attributes valueForKeyPath:@"id"];
        self.name = [attributes valueForKeyPath:@"name"];
        if ([[attributes valueForKey:@"icon"] isEqual:[NSNull null]]) {
            self.avatar = @"";
        }else {
            self.avatar = [attributes valueForKey:@"icon"];       
        }
        self.token = [attributes valueForKeyPath:@"token"];
    }

    return self;
}

@end
