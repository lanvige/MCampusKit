//
//  LTTopicReply.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCommunityReply.h"

@implementation MCKCommunityReply

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];

    self.mId = [dictionary safeObjectForKey:@"id"];
    self.userId = [[dictionary safeObjectForKey:@"userId"] intValue];
    self.userIcon = [dictionary safeObjectForKey:@"userIcon"];
    self.userName = [dictionary safeObjectForKey:@"userName"];
    self.userType = [dictionary safeObjectForKey:@"userType"];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.createtime = [formatter dateFromString:[dictionary safeObjectForKey:@"createtime"]];
}

@end
