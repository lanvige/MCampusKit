//
//  MCKNoticeReply.m
//  MCampusKit
//
//  Created by Lanvige Jiang on 4/19/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKNoticeReply.h"

@implementation MCKNoticeReply


- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.content = [dictionary safeObjectForKey:@"content"];
    self.createTime = [dictionary safeObjectForKey:@"createtime"];
    self.senderId = [dictionary safeObjectForKey:@"senderId"];
    self.senderName = [dictionary safeObjectForKey:@"senderName"];
    self.senderIcon = [dictionary safeObjectForKey:@"senderImg"];
}

@end
