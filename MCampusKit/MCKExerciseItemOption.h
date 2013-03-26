//
//  MCExerciseItemOption.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKExerciseItemOption : MCKModelBase

@property (nonatomic, assign) BOOL hasSelected;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) BOOL correct;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
