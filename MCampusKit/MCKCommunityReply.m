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
    [super unpackDictionary:dictionary];
    
    self.userId = [[dictionary safeObjectForKey:@"userId"] stringValue];
    self.userIcon = [dictionary safeObjectForKey:@"userIcon"];
    self.userName = [dictionary safeObjectForKey:@"userName"];
    self.userType = [dictionary safeObjectForKey:@"userType"];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.createtime = [dictionary safeObjectForKey:@"createtime"];
}

@end
