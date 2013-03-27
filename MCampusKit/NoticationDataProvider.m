//
//  NoticationDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "NoticationDataProvider.h"
#import "MCKNotification.h"

@implementation NoticationDataProvider

// http://222.66.33.210:9092/rest/v1/pn/ios/list/get?uid=39&fromid=114&getlatest=1&t=F0B09E1537ACCA3A
- (void)getNoticationsWithNoticationId:(NSString *)noticationId
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/pn/ios/list/get?fromid=%@&getlatest=%@", noticationId, latestType];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if ([jsonData isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary *attributes in jsonData) {
                 MCKNotification *notification = [[MCKNotification alloc] init];
                 [notification unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:notification];
             }
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

// First time to get top 20 items.
- (void)getFreshNoticationsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticationsWithNoticationId:@""
                              latestType:@"1"
                                 success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// Get new top ? items to current list
- (void)getUpdateNoticationsWithNoticationId:(NSString *)noticationId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticationsWithNoticationId:noticationId
                              latestType:@"1"
                                 success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// Get old 20 items to current list
- (void)getMoreNoticationsWithNoticationId:(NSString *)noticationId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticationsWithNoticationId:noticationId
                              latestType:@"0"
                                 success:^(MCKDataWrapper *dataWrapper) {
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
