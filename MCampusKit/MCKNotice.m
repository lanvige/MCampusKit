//
//  LTNotice.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKNotice.h"
#import "MCKStudyPlan.h"

@implementation MCKNotice

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];

    self.senderId = [dictionary safeObjectForKey:@"senderId"];
    self.senderName = [dictionary safeObjectForKey:@"senderName"];
    self.senderImg = [dictionary safeObjectForKey:@"senderImg"];
    self.messageTime = [dictionary safeObjectForKey:@"messageTime"];

    NSString *messageType = [dictionary safeObjectForKey:@"messageType"];

    if ([messageType isEqualToString:@"TextMessage"]) {
        self.noticeType = MCKNoticeTextType;
    } else if ([messageType isEqualToString:@"MMS"]) {
        self.noticeType = MCKNoticeMMSType;
    } else if ([messageType isEqualToString:@"Vote"]) {
        self.noticeType = MCKNoticeVoteType;
    } else {
        self.noticeType = MCKNoticeUnknownType;
    }

    self.messageContent = [dictionary safeObjectForKey:@"messageContent"];
    self.mmsImageUrl = [dictionary safeObjectForKey:@"mmsImageUrl"];

    if (!self.mmsImageUrl) {
        self.mmsImageUrl = @"";
    }

    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.mmsId = [[dictionary safeObjectForKey:@"mmsId"] intValue];
    self.repostUserId = [[dictionary safeObjectForKey:@"repostUserId"] intValue];
    self.repostUserName = [dictionary safeObjectForKey:@"repostUserName"];
    self.mmsImageIcon = [dictionary safeObjectForKey:@"mmsImageIcon"];
    self.senderType = [dictionary safeObjectForKey:@"senderType"];

    // Build Study Plan
    id studyPlanDic = [dictionary safeObjectForKey:@"studyPlan"];

    if (studyPlanDic) {
        self.studyPlan = [[MCKStudyPlan alloc] init];
        [self.studyPlan unpackDictionary:studyPlanDic];
    }
}

@end