//
//  LTCourseware.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCourseware.h"
#import "MCKFrameInfo.h"

@implementation MCKCourseware

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];

    self.title = [dictionary safeObjectForKey:@"title"];
    self.type = [[dictionary safeObjectForKey:@"type"] intValue];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.unit = [[dictionary safeObjectForKey:@"unit"] intValue];
    self.tags = [dictionary safeObjectForKey:@"tags"];
    self.bookcover = [dictionary safeObjectForKey:@"bookcover"];
    self.size = [[dictionary safeObjectForKey:@"size"] intValue];
    self.scoringAverage = [[dictionary safeObjectForKey:@"scoringAverage"] floatValue];
    self.version = [[dictionary safeObjectForKey:@"version"] intValue];

    // build array(maybe empty.)
    id frameInfoArray = [dictionary safeObjectForKey:@"frameInfoList"];

    if (frameInfoArray) {
        // Need init the array first.
        self.frameInfoList = [NSMutableArray arrayWithCapacity:[frameInfoArray count]];

        for (NSDictionary *fiAttributes in frameInfoArray) {
            MCKFrameInfo *frameInfo = [[MCKFrameInfo alloc] init];
            [frameInfo unpackDictionary:fiAttributes];
            [self.frameInfoList addObject:frameInfo];
        }
    }
}

@end