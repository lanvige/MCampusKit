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

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {

        self.mId = [attributes valueForKeyPath:@"id"];
        self.title = [attributes valueForKeyPath:@"title"];
        self.point = [[attributes valueForKeyPath:@"point"] intValue];

        // build topic reply array(maybe empty.)
        id optionsArray = [attributes objectForKey:@"optionList"];

        if (optionsArray != [NSNull null]) {
            // Need init the array first.
            self.optionList = [NSMutableArray arrayWithCapacity:[optionsArray count]];

            for (NSDictionary *optionAttributes in optionsArray) {
                MCKExerciseItemOption *option = [[MCKExerciseItemOption alloc] initWithAttributes:optionAttributes];
                [self.optionList addObject:option];
            }
        }
    }

    return self;
}


@end