//
//  LTStudyPlan.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKStudyPlan : MCKModelBase

@property (nonatomic, strong) NSDate *planDate;
@property (nonatomic, assign) NSInteger alarmMinutes;
@property (nonatomic, strong) NSString *place;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
