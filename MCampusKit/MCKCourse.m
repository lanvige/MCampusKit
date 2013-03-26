//
//  LTCourse.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCourse.h"

@implementation MCKCourse

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.mId = [attributes valueForKeyPath:@"id"];
        self.title = [attributes valueForKeyPath:@"title"];

        // self.progress = [[attributes valueForKeyPath:@"progress"] floatValue];
        self.studentCount = [[attributes valueForKeyPath:@"studentCount"] intValue];
        self.bookCover = [attributes valueForKeyPath:@"bookCover"];
        self.questionCount = [[attributes valueForKeyPath:@"questionCount"] intValue];
        self.status = [[attributes valueForKeyPath:@"status"] intValue];
        self.commentCount = [[attributes valueForKeyPath:@"commentCount"] intValue];
        self.commentStar = [[attributes valueForKeyPath:@"commentStar"] intValue];
        self.desc = [attributes valueForKeyPath:@"desc"];

        // Build teacher name list.
        NSMutableArray *teachernameList = [attributes objectForKey:@"teacherNameList"];
        self.teacherNameList = teachernameList;
    }

    return self;
}

@end
