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

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.courseProgress = [[attributes valueForKeyPath:@"courseProgress"] floatValue];
        self.coursewareCount = [[attributes valueForKeyPath:@"coursewareCount"] intValue];

        // build topic reply array(maybe empty.)
        id courseArray = [attributes objectForKey:@"coursewares"];

        if (courseArray != [NSNull null]) {
            // Need init the array first.
            self.coursewares = [NSMutableArray arrayWithCapacity:[courseArray count]];

            for (NSDictionary *lrAttributes in courseArray) {
                MCKCourseware *courseware = [[MCKCourseware alloc] initWithAttributes:lrAttributes];
                [self.coursewares addObject:courseware];
            }
        }
    }

    return self;
}

@end
