//
//  ApnDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 11/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "ApnDataProvider.h"

@implementation ApnDataProvider

// http://222.66.33.210:9092/rest/v1/user/ios/devices/save?uid=3&t=F3CD921D2CA61426&n=avd12321sadfdsaf
- (void)sendDeviceTokenWithDeviceToken:(NSString *)deviceToken
    success:(void (^)(MCKDataWrapper *configObject))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/ios/devices/save?n=%@", deviceToken];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         NSString *result = jsonData;
         [dataWrapper.modelList addObject:result];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
}

@end
