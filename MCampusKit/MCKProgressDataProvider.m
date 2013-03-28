//
//  ProgressDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProgressDataProvider.h"

#import "MCKProgressRanking.h"
#import "MCKProgress.h"
#import "MCKProgressSet.h"

@implementation MCKProgressDataProvider

// http://222.66.33.210:9092/rest/v1/course/courseware/exercise/ranking/mine?uid=39&course=2&t=F0B09E1537ACCA3A
//
- (void)getCourseRankingWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/courseware/exercise/ranking/mine?course=%@", courseId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKProgressRanking *progressRanking = [[MCKProgressRanking alloc] init];
             [progressRanking unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:progressRanking];

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

// 课程学习进度排名
// http://222.66.33.210:9092/rest/v1/course/progress/list/get?uid=39&course=2&pageIndex=1&t=F0B09E1537ACCA3A
// http://192.168.100.48:9092/rest/v2/course/progress/list/get?uid=154&course=79&pageIndex=1&t=195476BCBAF949E7&client=1
- (void)getProgressWithCourseId:(NSString *)courseId
    pageIndex:(NSInteger)pageIndex
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/progress/list/get?course=%@&pageIndex=%d", courseId, pageIndex];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKProgressSet *progressSet = [[MCKProgressSet alloc] init];
             [progressSet unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:progressSet];
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

@end