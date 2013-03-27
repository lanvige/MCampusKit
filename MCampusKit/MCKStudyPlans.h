//
//  LTStudyPlans.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKStudyPlans : MCKModelBase

@property (nonatomic, strong) NSString *strInsertName;
@property (nonatomic, strong) NSDate *planTime;
@property (nonatomic, strong) NSString *strPlanContent;
@property (nonatomic, strong) NSString *strPlanMemo;
@property (nonatomic, strong) NSString *strPlanPlace;
@property (nonatomic, strong) NSString *strIdentifier;
@property (nonatomic, strong) NSString *strPlanId;
@property (nonatomic, strong) NSString *strAlarm;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
