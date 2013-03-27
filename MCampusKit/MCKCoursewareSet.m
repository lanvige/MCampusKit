//
//  LTCoursewareSet.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCoursewareSet.h"
#import "MCKCourseware.h"

@implementation MCKCoursewareSet

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.courseProgress = [[dictionary safeObjectForKey:@"courseProgress"] floatValue];
    self.coursewareCount = [[dictionary safeObjectForKey:@"coursewareCount"] intValue];

    // build topic reply array(maybe empty.)
    id courseArray = [dictionary safeObjectForKey:@"coursewares"];

    if (courseArray != [NSNull null]) {
        // Need init the array first.
        self.coursewares = [NSMutableArray arrayWithCapacity:[courseArray count]];

        for (NSDictionary *lrAttributes in courseArray) {
            MCKCourseware *courseware = [[MCKCourseware alloc] init];
            [courseware unpackDictionary:lrAttributes];
            [self.coursewares addObject:courseware];
        }
    }
}

@end
