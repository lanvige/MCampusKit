//
//  ETMessageSummary.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKMessageSummary.h"

@implementation MCKMessageSummary

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    self.newNoticeCount = [[attributes valueForKeyPath:@"newNoticeCount"] intValue];
    self.newFriendMsgCount = [[attributes valueForKeyPath:@"newFriendMsgCount"] intValue];
    self.newDiscussionCount = [[attributes valueForKeyPath:@"newDiscussionCount"] intValue];
    self.newSystemMsgCount = [[attributes valueForKeyPath:@"newSystemMsgCount"] intValue];
    self.allNewMessageCount = [[attributes valueForKeyPath:@"allNewMessageCount"] intValue];

    return self;
}

@end
