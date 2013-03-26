//
//  LTConfiguration.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"
#import "MCKModelBase.h"

#define CONFIGURATION ((LTConfiguration *)[LTConfiguration sharedConfiguration])

@interface MCKConfiguration : MCKModelBase

@property (nonatomic, strong) NSString *restServerPath;
@property (nonatomic, strong) NSString *pushServer;
@property (nonatomic, strong) NSString *coursePackagePath;
@property (nonatomic, strong) NSString *coursePackageVersion;
@property (nonatomic, strong) NSString *landingPageUrl;

@property (nonatomic, strong) NSString *mySchoolIds;

+ (MCKConfiguration *)sharedConfiguration;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
