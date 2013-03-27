//
//  ApnDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 11/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@interface ApnDataProvider : MCKBaseDataProvider

- (void)sendDeviceTokenWithDeviceToken:(NSString *)deviceToken
    success:(void (^)(MCKDataWrapper *configObject))success
    failure:(void (^)(NSError *error))failure;

@end
