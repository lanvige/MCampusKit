//
//  LTProfileStudyDetail.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfileStudyDetail.h"

@implementation MCKProfileStudyDetail

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.friendCount = [[attributes valueForKeyPath:@"friendCount"] intValue];
    self.courseCount = [[attributes valueForKeyPath:@"courseCount"] intValue];
    self.discussionCount = [[attributes valueForKeyPath:@"discussionCount"] intValue];
    self.privateMsgCount = [[attributes valueForKeyPath:@"privateMsgCount"] intValue];
    self.isMyFriend = [[attributes valueForKeyPath:@"isMyFriend"] boolValue];
    
    return self;
}

@end
