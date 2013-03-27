//
//  LTFriend.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFriend.h"

@implementation MCKFriend

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.name = [dictionary safeObjectForKey:@"name"];
    self.icon = [dictionary safeObjectForKey:@"icon"];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.groupId = [[dictionary safeObjectForKey:@"groupId"] intValue];
    self.phoneNumber = [dictionary safeObjectForKey:@"phoneNumber"];
    self.hasClient = [[dictionary safeObjectForKey:@"hasClient"] boolValue];
    self.myClassmate = [[dictionary safeObjectForKey:@"myClassmate"] boolValue];
}

@end
