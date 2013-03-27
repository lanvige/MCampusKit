//
//  LTVote.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKVote.h"
#import "MCKVoteOption.h"

@implementation MCKVote

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"voteId"];
    self.noticeId = [dictionary safeObjectForKey:@"messageId"];
    self.title = [dictionary safeObjectForKey:@"title"];
    self.votedOption = [dictionary safeObjectForKey:@"votedOption"];

    // build topic reply array(maybe empty.)
    id optionsArray = [dictionary safeObjectForKey:@"options"];

    if (optionsArray != [NSNull null]) {
        // Need init the array first.
        self.options = [NSMutableArray arrayWithCapacity:[optionsArray count]];

        for (NSDictionary *voAttributes in optionsArray) {
            MCKVoteOption *voteOption = [[MCKVoteOption alloc] init];
            [voteOption unpackDictionary:voAttributes];
            [self.options addObject:voteOption];
        }
    }
}

@end