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

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    self.mId = [attributes valueForKeyPath:@"id"];
    self.userId = [[attributes valueForKeyPath:@"userId"] intValue];
    self.userName = [attributes valueForKeyPath:@"userName"];
    self.userIcon = [attributes valueForKeyPath:@"userIcon"];
    self.userType = [attributes valueForKeyPath:@"userType"];
    self.tags = [attributes valueForKeyPath:@"tags"];
    self.content = [attributes valueForKeyPath:@"content"];
    self.resourceUrl = [attributes valueForKey:@"resourceUrl"];
    self.courseId = [attributes valueForKey:@"course"];
    self.courseName = [attributes valueForKey:@"courseName"];
    self.coursewareId = [attributes valueForKey:@"courseware"];
    self.coursewareName = [attributes valueForKey:@"coursewareName"];
    self.createtime = [attributes valueForKeyPath:@"createtime"];
    self.replayCount = [[attributes valueForKeyPath:@"replyCount"] intValue];
    self.updateTimestamp = [attributes valueForKeyPath:@"updateTimestamp"];

    // build topic reply array(maybe empty.)
    id repliesArray = [attributes objectForKey:@"replies"];

    if (repliesArray != [NSNull null]) {
        // Need init the array first.
        self.replies = [NSMutableArray arrayWithCapacity:[repliesArray count]];

        for (NSDictionary *lrAttributes in repliesArray) {
            MCKCommunityReply *topicReply = [[MCKCommunityReply alloc] initWithAttributes:lrAttributes];
            [self.replies addObject:topicReply];
        }
    }

    return self;
}

@end
