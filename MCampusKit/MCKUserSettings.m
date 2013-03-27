//
//  LTUserSettings.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUserSettings.h"

@implementation MCKUserSettings

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.canBeInvited = [[dictionary safeObjectForKey:@"canBeInvited"] boolValue];
    self.showProfile = [[dictionary safeObjectForKey:@"showProfile"] boolValue];
}

@end
