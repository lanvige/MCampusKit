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

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.mId = [attributes valueForKeyPath:@"id"];
        self.title = [attributes valueForKeyPath:@"title"];
        self.type = [[attributes valueForKeyPath:@"type"] intValue];
        self.status = [[attributes valueForKeyPath:@"status"] intValue];
        self.unit = [[attributes valueForKeyPath:@"unit"] intValue];
        self.tags = [attributes valueForKeyPath:@"tags"];
        self.bookcover = [attributes valueForKeyPath:@"bookcover"];
        self.size = [[attributes valueForKeyPath:@"size"] intValue];
        self.scoringAverage = [[attributes valueForKeyPath:@"scoringAverage"] floatValue];
        self.version = [[attributes valueForKey:@"version"] intValue];

        // build array(maybe empty.)
        id frameInfoArray = [attributes objectForKey:@"frameInfoList"];

        if (frameInfoArray != [NSNull null]) {
            // Need init the array first.
            self.frameInfoList = [NSMutableArray arrayWithCapacity:[frameInfoArray count]];

            for (NSDictionary *fiAttributes in frameInfoArray) {
                MCKFrameInfo *frameInfo = [[MCKFrameInfo alloc] initWithAttributes:fiAttributes];
                [self.frameInfoList addObject:frameInfo];
            }
        }
    }

    return self;
}

@end