//
//  LTProfileStudyDetail.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfileStudyDetail.h"

@implementation MCKProfileStudyDetail

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.friendCount = [[dictionary safeObjectForKey:@"friendCount"] intValue];
    self.courseCount = [[dictionary safeObjectForKey:@"courseCount"] intValue];
    self.discussionCount = [[dictionary safeObjectForKey:@"discussionCount"] intValue];
    self.privateMsgCount = [[dictionary safeObjectForKey:@"privateMsgCount"] intValue];
    self.isMyFriend = [[dictionary safeObjectForKey:@"isMyFriend"] boolValue];
}

@end
