//
//  LTProgressRanking.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//


#import "MCKModelBaseIdentifier.h"

@interface MCKProgressRanking : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *bookCover;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL hasNewQuestion;
@property (nonatomic, assign) int myRanking;
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) int questionCount;
@property (nonatomic, strong) NSString *rankingDesc;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int studentCount;
@property (nonatomic, assign) int supportCount;
@property (nonatomic, assign) int wareAmount;

@property (nonatomic, strong) NSArray *teacherNameList;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
