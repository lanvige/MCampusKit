//
//  LTTopic.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCommunity.h"
#import "MCKCommunityReply.h"

@implementation MCKCommunity

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"id"];
    self.userId = [[dictionary safeObjectForKey:@"userId"] intValue];
    self.userName = [dictionary safeObjectForKey:@"userName"];
    self.userIcon = [dictionary safeObjectForKey:@"userIcon"];
    self.userType = [dictionary safeObjectForKey:@"userType"];
    self.tags = [dictionary safeObjectForKey:@"tags"];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.resourceUrl = [dictionary safeObjectForKey:@"resourceUrl"];
    self.courseId = [dictionary safeObjectForKey:@"course"];
    self.courseName = [dictionary safeObjectForKey:@"courseName"];
    self.coursewareId = [dictionary safeObjectForKey:@"courseware"];
    self.coursewareName = [dictionary safeObjectForKey:@"coursewareName"];
    self.createtime = [dictionary safeObjectForKey:@"createtime"];
    self.replayCount = [[dictionary safeObjectForKey:@"replyCount"] intValue];
    self.updateTimestamp = [dictionary safeObjectForKey:@"updateTimestamp"];

    // build topic reply array(maybe empty.)
    id repliesArray = [dictionary safeObjectForKey:@"replies"];

    if (repliesArray) {
        // Need init the array first.
        self.replies = [NSMutableArray arrayWithCapacity:[repliesArray count]];

        for (NSDictionary *lrAttributes in repliesArray) {
            MCKCommunityReply *topicReply = [[MCKCommunityReply alloc] init];
            [topicReply unpackDictionary:lrAttributes];
            [self.replies addObject:topicReply];
        }
    }
}

@end
