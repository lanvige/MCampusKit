//
//  LTProfileInfo.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfileInfo.h"

@implementation MCKProfileInfo

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.gender = [[dictionary safeObjectForKey:@"gender"] intValue];
    self.cityCode = [dictionary safeObjectForKey:@"cityCode"];
    self.cityName = [dictionary safeObjectForKey:@"cityName"];
    self.birthdate = [dictionary safeObjectForKey:@"birthdate"];
    self.className = [dictionary safeObjectForKey:@"className"];
    self.phoneNumber = [dictionary safeObjectForKey:@"phoneNumber"];
    self.hobby = [dictionary safeObjectForKey:@"hobby"];
    self.qqNumber = [dictionary safeObjectForKey:@"qqNumber"];
}

@end
