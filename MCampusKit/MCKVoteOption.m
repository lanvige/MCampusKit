//
//  LTVoteOption.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKVoteOption.h"

@implementation MCKVoteOption

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.content = [dictionary safeObjectForKey:@"content"];
    self.value = [dictionary safeObjectForKey:@"value"];
}

@end
