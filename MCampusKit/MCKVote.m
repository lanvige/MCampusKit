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

@synthesize noticeId, title, votedOption, options;

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.mId = [attributes valueForKeyPath:@"voteId"];
        self.noticeId = [attributes valueForKeyPath:@"messageId"];
        self.title = [attributes valueForKeyPath:@"title"];
        self.votedOption = [attributes valueForKeyPath:@"votedOption"];

        // build topic reply array(maybe empty.)
        id optionsArray = [attributes objectForKey:@"options"];

        if (optionsArray != [NSNull null]) {
            // Need init the array first.
            self.options = [NSMutableArray arrayWithCapacity:[optionsArray count]];

            for (NSDictionary *voAttributes in optionsArray) {
                MCKVoteOption *voteOption = [[MCKVoteOption alloc] initWithAttributes:voAttributes];
                [self.options addObject:voteOption];
            }
        }
    }

    return self;
}

@end
