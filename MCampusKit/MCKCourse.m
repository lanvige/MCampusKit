//
//  LTCourse.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCourse.h"

@implementation MCKCourse

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"id"];
    self.title = [dictionary safeObjectForKey:@"title"];
    self.studentCount = [[dictionary safeObjectForKey:@"studentCount"] intValue];
    self.bookCover = [dictionary safeObjectForKey:@"bookCover"];
    self.questionCount = [[dictionary safeObjectForKey:@"questionCount"] intValue];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.commentCount = [[dictionary safeObjectForKey:@"commentCount"] intValue];
    self.commentStar = [[dictionary safeObjectForKey:@"commentStar"] intValue];
    self.desc = [dictionary safeObjectForKey:@"desc"];

    // Build teacher name list.
    NSMutableArray *teachernameList = [dictionary safeObjectForKey:@"teacherNameList"];
    self.teacherNameList = teachernameList;
}

@end
