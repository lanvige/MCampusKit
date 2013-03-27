//
//  LTProgressRanking.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgressRanking.h"

@implementation MCKProgressRanking

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"id"];
    self.title = [dictionary safeObjectForKey:@"title"];
    self.bookCover = [dictionary safeObjectForKey:@"bookCover"];
    self.myRanking =  [[dictionary safeObjectForKey:@"myRanking"] intValue];
    self.hasNewQuestion = [[dictionary safeObjectForKey:@"hasNewQuestion"] intValue];
    self.progress = [[dictionary safeObjectForKey:@"progress"] floatValue];
    self.questionCount = [[dictionary safeObjectForKey:@"questionCount"] intValue];
    self.rankingDesc = [dictionary safeObjectForKey:@"rankingDesc"];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.studentCount = [[dictionary safeObjectForKey:@"studentCount"] intValue];
    self.supportCount = [[dictionary safeObjectForKey:@"supportCount"] intValue];
    self.wareAmount = [[dictionary safeObjectForKey:@"wareAmount"] intValue];

    // Build teacher name list.
    NSMutableArray *teachernameList = [dictionary safeObjectForKey:@"teacherNameList"];
    self.teacherNameList = teachernameList;
}

@end
