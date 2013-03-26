//
//  LTCoursewareSet.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKCoursewareSet : MCKModelBase

@property (nonatomic, assign) float courseProgress;
@property (nonatomic, assign) int coursewareCount;

@property (nonatomic, strong) NSMutableArray *coursewares;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
