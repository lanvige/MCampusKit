//
//  ETMessageSummary.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKMessageSummary.h"

@implementation MCKMessageSummary

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.newNoticeCount = [[dictionary safeObjectForKey:@"newNoticeCount"] intValue];
    self.newFriendMsgCount = [[dictionary safeObjectForKey:@"newFriendMsgCount"] intValue];
    self.newDiscussionCount = [[dictionary safeObjectForKey:@"newDiscussionCount"] intValue];
    self.newSystemMsgCount = [[dictionary safeObjectForKey:@"newSystemMsgCount"] intValue];
    self.allNewMessageCount = [[dictionary safeObjectForKey:@"allNewMessageCount"] intValue];
}

@end
