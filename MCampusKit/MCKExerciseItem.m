//
//  ExerciseItem.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKExerciseItem.h"
#import "MCKExerciseItemOption.h"

@implementation MCKExerciseItem

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.title = [dictionary safeObjectForKey:@"title"];
    self.point = [[dictionary safeObjectForKey:@"point"] intValue];

    // build topic reply array(maybe empty.)
    id optionsArray = [dictionary safeObjectForKey:@"optionList"];

    if (optionsArray) {
        // Need init the array first.
        self.optionList = [NSMutableArray arrayWithCapacity:[optionsArray count]];

        for (NSDictionary *optionAttributes in optionsArray) {
            MCKExerciseItemOption *option = [[MCKExerciseItemOption alloc] init];
            [option unpackDictionary:optionAttributes];
            [self.optionList addObject:option];
        }
    }
}


@end