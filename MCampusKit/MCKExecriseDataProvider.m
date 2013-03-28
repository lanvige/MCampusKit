//
//  ExecriseDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lantop Co. Ltd. All rights reserved.
//

#import "MCKExecriseDataProvider.h"
#import "MCKFriend.h"
#import "MCKExerciseItem.h"

@implementation MCKExecriseDataProvider

// http://192.168.100.48:9092/rest/v2/course/ios/courseware/exercise/list/get?uid=39&courseware=3&t=F0B09E1537ACCA3A&from=1361961384283
- (void)getExecriseWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/ios/courseware/exercise/list/get?courseware=%@", coursewareId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKExerciseItem *exerciseItem = [[MCKExerciseItem alloc] init];
                 [exerciseItem unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:exerciseItem];
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

// http://192.168.100.193:8080/rest/v1/course/courseware/exercise/submit?uid=12&courseware=5&answer=100,12,300%7C1,10@2,0@3,@4,20
- (void)postExecriseWithCoursewareId:(NSString *)coursewareId
    answer:(NSString *)answer
    success:(void (^)(BOOL result))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/course/courseware/exercise/submit?courseware=%@&answer=%@", coursewareId, answer];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             if (success) {
                 success(TRUE);
             }
         } else {
             success(FALSE);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// 这些好友也做过
// http://192.168.100.48:9092/rest/v1/course/courseware/exercise/friend/get?uid=154&courseware=545&t=195476BCBAF949E7&client=1
- (void)getFriendsDidTheExecriseWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/course/courseware/exercise/friend/get?courseware=%@", coursewareId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             NSArray *friendList = (NSArray *) jsonData;
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[friendList count]];

             for (NSDictionary * attributes in friendList) {
                 MCKFriend *friend = [[MCKFriend alloc] init];
                 [friend unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:friend];
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

// http://192.168.100.48:9092/rest/v1/course/courseware/5/exercise/score?uid=10&t=49832AA1628239C5
- (void)getHighestScoreWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/course/courseware/%@/exercise/score?", coursewareId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             [dataWrapper.modelList addObject:jsonData];

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
