//
//  LTProgressRanking.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgressRanking.h"

@implementation MCKProgressRanking

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.mId = [attributes valueForKeyPath:@"id"];
        self.title = [attributes valueForKeyPath:@"title"];
        self.bookCover = [attributes valueForKeyPath:@"bookCover"];
        self.myRanking =  [[attributes valueForKeyPath:@"myRanking"] intValue];
        self.hasNewQuestion = [[attributes valueForKeyPath:@"hasNewQuestion"] intValue];
        self.progress = [[attributes valueForKeyPath:@"progress"] floatValue];
        self.questionCount = [[attributes valueForKeyPath:@"questionCount"] intValue];
        self.rankingDesc = [attributes valueForKeyPath:@"rankingDesc"];
        self.status = [[attributes valueForKeyPath:@"status"] intValue];
        self.studentCount = [[attributes valueForKeyPath:@"studentCount"] intValue];
        self.supportCount = [[attributes valueForKeyPath:@"supportCount"] intValue];
        self.wareAmount = [[attributes valueForKeyPath:@"wareAmount"] intValue];

        // Build teacher name list.
        NSMutableArray *teachernameList = [attributes objectForKey:@"teacherNameList"];
        self.teacherNameList = teachernameList;
    }

    return self;
}

@end
