//
//  ConfigurationDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/12/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKConfigurationDataProvider.h"

#import "MCKHTTPClient.h"
#import "MCKDataWrapper.h"
#import "MCKConfiguration.h"

@implementation MCKConfigurationDataProvider

// http://222.66.33.210:9092/rest/v1/comm/ios/config/get?&client=2&uid=3&t=F3CD921D2CA61426
- (void)getConfigurationsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/comm/ios/config/get?"];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKConfiguration *conf = [[MCKConfiguration alloc] init];
             [conf unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:conf];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
}

@end
