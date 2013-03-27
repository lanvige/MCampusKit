//
//  UserContext.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUserContext.h"

@implementation MCKUserContext

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"id"];
    self.name = [dictionary safeObjectForKey:@"name"];
    self.avatar = [dictionary safeObjectForKey:@"icon"];

    if (!self.avatar) {
        self.avatar = @"";
    }

    self.token = [dictionary safeObjectForKey:@"token"];
}

@end
