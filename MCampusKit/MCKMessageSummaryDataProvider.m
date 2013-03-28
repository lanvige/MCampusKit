//
//  MessageSummaryDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKMessageSummaryDataProvider.h"
#import "MCKHTTPClient.h"
#import "MCKDataWrapper.h"
#import "MCKMessageSummary.h"
#import "MCKConfiguration.h"

@implementation MCKMessageSummaryDataProvider

- (void)getMessageSummaryWithTimestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    // FIXME:
//    NSString *mySchools = [(MCKConfiguration *)[CACHEMANAGER restore:kConfigurationCacheKey] mySchoolIds];
    NSString *mySchools = @"";
    NSString *path = [NSString stringWithFormat:@"v1/msg/summary?from=%@&schools=%@", timestamp, mySchools];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKMessageSummary *messageSummary = [[MCKMessageSummary alloc] init];
             [messageSummary unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:messageSummary];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/msg/summary?uid=39&from=&schools=1%2C2%2C&t=F0B09E1537ACCA3A
- (void)getMessageSummaryWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getMessageSummaryWithTimestamp:@"" success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

@end
