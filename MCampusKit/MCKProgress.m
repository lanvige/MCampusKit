//
//  LTProgress.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgress.h"

@implementation MCKProgress

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.mId = [attributes valueForKeyPath:@"id"];
        self.name = [attributes valueForKeyPath:@"name"];
        self.icon = [attributes valueForKeyPath:@"icon"];
        self.progress = [[attributes valueForKeyPath:@"progress"] floatValue];
        self.isMyClassMate = [[attributes valueForKeyPath:@"name"] boolValue];
    }

    return self;
}

@end
