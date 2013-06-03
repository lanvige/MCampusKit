//
//  LTCourse.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"

@interface MCKCourse : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) NSInteger studentCount;
@property (nonatomic, strong) NSString *bookCover;
@property (nonatomic, assign) NSInteger questionCount;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger commentCount;
@property (nonatomic, assign) NSInteger commentStar;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) NSInteger role; // role:0我的课程；1编辑课程;2授权课程
@property (nonatomic, strong) NSMutableArray *teacherNameList;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
