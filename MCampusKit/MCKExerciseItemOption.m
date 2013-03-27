//
//  MCExerciseItemOption.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKExerciseItemOption.h"

@implementation MCKExerciseItemOption

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.hasSelected = [[dictionary safeObjectForKey:@"hasSelected"] boolValue];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.correct = [[dictionary safeObjectForKey:@"correct"] boolValue];
}

@end
