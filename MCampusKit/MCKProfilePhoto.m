//
//  LTProfilePhoto.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfilePhoto.h"

@implementation MCKProfilePhoto

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
 
    self.url = [dictionary safeObjectForKey:@"url"];
    self.isDefault = [[dictionary safeObjectForKey:@"isDefault"] boolValue];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
}

@end
