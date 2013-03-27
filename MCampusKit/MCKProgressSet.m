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

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.recordCount = [[dictionary safeObjectForKey:@"recordCount"] intValue];

    // build topic reply array(maybe empty.)
    id progressArray = [dictionary safeObjectForKey:@"pageData"];

    if (progressArray) {
        self.progresses = [NSMutableArray arrayWithCapacity:[progressArray count]];

        for (NSDictionary *progressAttributes in progressArray) {
            MCKProgress *progress = [[MCKProgress alloc] init];
            [progress unpackDictionary:progressAttributes];
            [self.progresses addObject:progress];
        }
    }
}

@end
