//
//  ConfigurationDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/12/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@class MCKDataWrapper, MCConfiguration;

@interface ConfigurationDataProvider : MCKBaseDataProvider

- (void)getConfigurationsWithSuccess:(void (^)(MCKDataWrapper *configObject))success
    failure:(void (^)(NSError *error))failure;

@end
