//
//  LTCourseware.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKCourseware : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) NSInteger unit;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, strong) NSString *bookcover;
@property (nonatomic, assign) float scoringAverage;
@property (nonatomic, assign) NSInteger version;
@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSMutableArray *frameInfoList;

@property (nonatomic, strong) NSString *courseTitle;
@property (nonatomic, assign) BOOL hasLocalFile;

- (void)unpackDictionary:(NSDictionary *)dictionary;


@end
