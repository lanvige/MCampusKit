//
//  LTStudyPlan.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKStudyPlan.h"

@implementation MCKStudyPlan

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];

    self.planDate = [formatter dateFromString:[attributes valueForKeyPath:@"date"]];
    self.alarmMinutes = [[attributes valueForKeyPath:@"alarmMinutes"] intValue];
    self.place = [attributes valueForKeyPath:@"place"];
    self.title = [attributes valueForKeyPath:@"title"];
    self.description = [attributes valueForKeyPath:@"description"];

    return self;
}

@end
