//
//  LTConfiguration.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKConfiguration.h"

@implementation MCKConfiguration

+ (MCKConfiguration *)sharedConfiguration
{
    static MCKConfiguration *_sharedUserContext = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
                      _sharedUserContext = [[MCKConfiguration alloc] init];
                  });

    return _sharedUserContext;
}

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.restServerPath = [dictionary safeObjectForKey:@"restServerPath"];
    self.pushServer = [dictionary safeObjectForKey:@"pushServer"];
    self.coursePackagePath = [dictionary safeObjectForKey:@"coursePackagePath"];
    self.landingPageUrl = [dictionary safeObjectForKey:@"landingPageUrl"];

    self.mySchoolIds = [dictionary safeObjectForKey:@"mySchoolIds"];
}

@end
