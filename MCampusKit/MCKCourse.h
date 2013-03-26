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
@property (nonatomic, assign) int studentCount;
@property (nonatomic, strong) NSString *bookCover;
@property (nonatomic, assign) int questionCount;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int commentCount;
@property (nonatomic, assign) int commentStar;
@property (nonatomic, strong) NSString *desc;

@property (nonatomic, strong) NSMutableArray *teacherNameList;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
