//
//  LTProfileInfo.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfileInfo.h"

@implementation MCKProfileInfo

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    // build frame
    self = [super init];

    if (!self) {
        return nil;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy/MM/dd"];

    self.gender = [[attributes valueForKeyPath:@"gender"] intValue];
    self.cityCode = [attributes valueForKeyPath:@"cityCode"];
    self.cityName = [attributes valueForKey:@"cityName"];
    self.birthdate = [formatter dateFromString:[attributes valueForKeyPath:@"birthdate"]];
    self.className = [attributes valueForKeyPath:@"className"];
    self.phoneNumber = [attributes valueForKey:@"phoneNumber"];
    self.hobby = [attributes valueForKeyPath:@"hobby"];
    self.qqNumber = [attributes valueForKey:@"qqNumber"];
    return self;
}

@end
