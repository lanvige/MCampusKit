//
//  LTProgress.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgress.h"

@implementation MCKProgress

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"id"];
    self.name = [dictionary safeObjectForKey:@"name"];
    self.icon = [dictionary safeObjectForKey:@"icon"];
    self.progress = [[dictionary safeObjectForKey:@"progress"] floatValue];
    self.isMyClassMate = [[dictionary safeObjectForKey:@"name"] boolValue];
}

@end
