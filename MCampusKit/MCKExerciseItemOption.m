//
//  MCExerciseItemOption.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKExerciseItemOption.h"

@implementation MCKExerciseItemOption

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.hasSelected = [[attributes valueForKeyPath:@"hasSelected"] boolValue];
        self.content = [attributes valueForKeyPath:@"content"];
        self.correct = [[attributes valueForKeyPath:@"correct"] boolValue];
    }

    return self;
}

@end
