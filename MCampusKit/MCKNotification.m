//
//  LTNotification.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKNotification.h"

@implementation MCKNotification

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];
    
    [super unpackDictionary:dictionary];
    
    self.senderId = [dictionary safeObjectForKey:@"senderId"];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.type = [[dictionary safeObjectForKey:@"type"] intValue];
    self.createtime = [formatter dateFromString:[dictionary safeObjectForKey:@"createtime"]];
    self.parameter = [dictionary safeObjectForKey:@"parameter"];

    // build user
    id userDict = [dictionary safeObjectForKey:@"user"];
    if (userDict) {
        self.user = [[MCKUser alloc] init];
        [self.user unpackDictionary:userDict];
    }
}

@end