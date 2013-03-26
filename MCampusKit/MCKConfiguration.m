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

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self.restServerPath = [attributes valueForKeyPath:@"restServerPath"];
    self.pushServer = [attributes valueForKeyPath:@"pushServer"];
    self.coursePackagePath = [attributes valueForKeyPath:@"coursePackagePath"];
    self.coursePackageVersion = [attributes valueForKeyPath:@"coursePackageVersion"];
    self.landingPageUrl = [attributes valueForKeyPath:@"landingPageUrl"];

    // Build teacher name list.
//    NSArray *schoolIds = [[attributes objectForKey:@"mySchoolIds"] componentsSeparatedByString:@","];
//    self.mySchoolIds = schoolIds;
    self.mySchoolIds = [attributes valueForKeyPath:@"mySchoolIds"];

    return self;
}

@end
