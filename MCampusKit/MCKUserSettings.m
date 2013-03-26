//
//  LTUserSettings.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUserSettings.h"

@implementation MCKUserSettings

@synthesize canBeInvited, showProfile;

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    self.canBeInvited = [[attributes valueForKeyPath:@"canBeInvited"] boolValue];
    self.showProfile = [[attributes valueForKeyPath:@"showProfile"] boolValue];

    return self;
}

@end
