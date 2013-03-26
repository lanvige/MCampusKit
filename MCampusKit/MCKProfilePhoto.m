//
//  LTProfilePhoto.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfilePhoto.h"

@implementation MCKProfilePhoto

@synthesize url, isDefault, status;

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.mId = [attributes valueForKeyPath:@"id"];
    self.url = [attributes valueForKeyPath:@"url"];
    self.isDefault = [[attributes valueForKey:@"isDefault"] boolValue];
    self.status = [[attributes valueForKeyPath:@"status"] intValue];
    
    return self;
}

@end
