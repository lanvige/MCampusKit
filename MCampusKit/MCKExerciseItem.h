//
//  ExerciseItem.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKExerciseItem : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger point;
@property (nonatomic, strong) NSMutableArray *optionList;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
