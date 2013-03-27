//
//  LTStudyPlan.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKStudyPlan.h"

@implementation MCKStudyPlan

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    self.planDate = [formatter dateFromString:[dictionary safeObjectForKey:@"date"]];
    self.alarmMinutes = [[dictionary safeObjectForKey:@"alarmMinutes"] intValue];
    self.place = [dictionary safeObjectForKey:@"place"];
    self.title = [dictionary safeObjectForKey:@"title"];
    self.description = [dictionary safeObjectForKey:@"description"];
}

@end
