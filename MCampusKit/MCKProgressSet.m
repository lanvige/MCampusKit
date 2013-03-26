//
//  LTProgressSet.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgressSet.h"
#import "MCKProgress.h"

@implementation MCKProgressSet

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.recordCount = [[attributes valueForKeyPath:@"recordCount"] intValue];

        // build topic reply array(maybe empty.)
        id progressArray = [attributes objectForKey:@"pageData"];

        if (progressArray != [NSNull null]) {
            // Need init the array first.
            self.progresses = [NSMutableArray arrayWithCapacity:[progressArray count]];

            for (NSDictionary *progressAttributes in progressArray) {
                MCKProgress *progress = [[MCKProgress alloc] initWithAttributes:progressAttributes];
                [self.progresses addObject:progress];
            }
        }
    }

    return self;
}

@end
