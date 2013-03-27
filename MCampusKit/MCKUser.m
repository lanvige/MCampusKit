//
//  User.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUser.h"

@implementation MCKUser

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"userId"];
    self.username = [dictionary safeObjectForKey:@"userName"];
    self.avatar = [dictionary safeObjectForKey:@"icon"];
}

@end
