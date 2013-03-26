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

#pragma mark - Build object with Dictionar

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    self.mId = [attributes valueForKeyPath:@"id"];
    self.senderId = [attributes valueForKeyPath:@"senderId"];
    self.senderName = [attributes valueForKeyPath:@"senderName"];
    self.senderImg = [attributes valueForKeyPath:@"senderImg"];
    self.messageTime = [attributes valueForKeyPath:@"messageTime"];
//    self.messageType = [[attributes valueForKeyPath:@"messageType"] intValue];
    self.messageType = [attributes valueForKeyPath:@"messageType"];

    self.messageContent = [attributes valueForKeyPath:@"messageContent"];

    if ([[attributes valueForKeyPath:@"mmsImageUrl"] isEqual:[NSNull null]]) {
        self.mmsImageUrl = @"";
    } else {
        self.mmsImageUrl = [attributes valueForKeyPath:@"mmsImageUrl"];
    }

    self.status = [[attributes valueForKeyPath:@"status"] intValue];
    self.mmsId = [[attributes valueForKeyPath:@"mmsId"] intValue];
    self.repostUserId = [[attributes valueForKeyPath:@"repostUserId"] intValue];
    self.repostUserName = [attributes valueForKeyPath:@"repostUserName"];
    self.mmsImageIcon = [attributes valueForKeyPath:@"mmsImageIcon"];
    self.senderType = [attributes valueForKeyPath:@"senderType"];

    // Build Study Plan

    id studyPlanDic = [attributes objectForKey:@"studyPlan"];

    if (studyPlanDic != [NSNull null]) {
        self.studyPlan = [[MCKStudyPlan alloc] initWithAttributes:studyPlanDic];
    }

    return self;
}

@end
