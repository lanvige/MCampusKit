//
//  MCFriendVt.m
//  MCampusKit
//
//  Created by Lanvige Jiang on 6/28/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFriendVt.h"

@implementation MCKFriendVt

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.name = [dictionary safeObjectForKey:@"name"];
    self.icon = [dictionary safeObjectForKey:@"icon"];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.phoneNumber = [dictionary safeObjectForKey:@"phoneNumber"];
    self.hasClient = [[dictionary safeObjectForKey:@"hasClient"] boolValue];
    self.myColleague = [[dictionary safeObjectForKey:@"myColleague"] boolValue];
}

@end
