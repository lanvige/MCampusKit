//
//  LTVoteOption.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKVoteOption.h"

@implementation MCKVoteOption

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.content = [attributes valueForKeyPath:@"content"];
        self.value = [attributes valueForKeyPath:@"value"];
    }

    return self;
}

@end
