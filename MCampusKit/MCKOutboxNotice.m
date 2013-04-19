//
//  MCKOutboxNotice.m
//  MCampusKit
//
//  Created by Lanvige Jiang on 4/19/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKOutboxNotice.h"

@implementation MCKOutboxNotice


- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.content = [dictionary safeObjectForKey:@"content"];
    self.receiveCount = [[dictionary safeObjectForKey:@"receiveCount"] intValue];
    self.signCount = [[dictionary safeObjectForKey:@"signCount"] intValue];
    self.replyCount = [[dictionary safeObjectForKey:@"replyCount"] intValue];
    self.createTime = [dictionary safeObjectForKey:@"createtime"];
    self.senderId = [dictionary safeObjectForKey:@"senderId"];
    self.senderName = [dictionary safeObjectForKey:@"senderName"];
    self.senderIcon = [dictionary safeObjectForKey:@"senderImg"];
}

@end
