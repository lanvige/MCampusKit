//
//  CoursewareDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCoursewareDataProvider.h"

#import "MCKCourseware.h"
#import "MCKCoursewareSet.h"
#import "MCKFrameInfo.h"

@implementation MCKCoursewareDataProvider

// http://222.66.33.210:9092/rest/v1/course/courseware/get?uid=39&course=15&from=&t=F0B09E1537ACCA3A
- (void)getCoursewaresWithCourse:(NSString *)courseId
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/courseware/get?course=%@&from=%@", courseId, timestamp];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKCoursewareSet *coursewareSet = [[MCKCoursewareSet alloc] init];
             [coursewareSet unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:coursewareSet];
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

// http://222.66.33.210:9092/rest/v1/course/courseware/get?uid=39&course=15&from=&t=F0B09E1537ACCA3A
- (void)getCoursewaresWithCourse:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getCoursewaresWithCourse:courseId
                         timestamp:@""
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

// http://192.168.100.48:9092/rest/v2/course/156/coursewares?uid=12&t=C6EA77605626FC74
- (void)getCoursewaresWithCourseIdV2:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/%@/coursewares?", courseId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKCoursewareSet *coursewareSet = [[MCKCoursewareSet alloc] init];
             [coursewareSet unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:coursewareSet];
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

// http://192.168.100.48:9092/rest/v1/t/course/169/coursewares?uid=12&t=C6EA77605626FC74
- (void)getCoursewaresVtWithCourseId:(NSString *)courseId
     success:(void (^)(MCKDataWrapper *))success
     failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/course/%@/coursewares?", courseId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKCoursewareSet *coursewareSet = [[MCKCoursewareSet alloc] init];
             [coursewareSet unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:coursewareSet];
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


// 单个课件的帧信息列表(4.3) 参数：课件ID
// http://192.168.100.48:9092/rest/v2/course/courseware/527/frames?uid=12&t=C6EA77605626FC74
- (void)getCoursewareFrameInfoWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/courseware/%@/frames?", coursewareId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject) {
         if (responseObject != [NSNull null]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[responseObject count]];

             for (NSDictionary * attributes in responseObject) {
                 MCKFrameInfo *frameInfo = [[MCKFrameInfo alloc] init];
                 [frameInfo unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:frameInfo];
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


// 单个课件的帧信息列表(4.3) 参数：课件ID
// http://192.168.100.48:9092/rest/v2/course/courseware/527/frames?uid=12&t=C6EA77605626FC74
- (void)getCoursewareFrameInfoContentWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/courseware/%@/frames?", coursewareId];

    [self getContentWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
         id jsonData = [responseObject safeObjectForKey:@"data"];

         if (success) {
             success(jsonData);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// Get the #Content# not object.
// http://222.66.33.210:9092/rest/v1/course/courseware/5?course=92&from=&client=2&uid=3&t=F3CD921D2CA61426
// http://222.66.33.210:9092/rest/v1/course/courseware/5?uid=39&course=2&from=&t=F0B09E1537ACCA3A
- (void)getCoursewareContentWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    success:(void (^)(id jsonData))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"course/courseware/%@?course=%@&from=", coursewareId, courseId];

    [self getContentWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/course/courseware/QA/get?uid={0}&courseware={1}&from={2}
- (void)getCoursewareCommentsContentWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"course/courseware/QA/get?courseware=%@&from=", coursewareId];

    [self getContentWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}


// http://192.168.100.48:9092/rest/v1/course/courseware/exercise/list/get?uid=12&t=C6EA77605626FC74&courseware=11
- (void)getCoursewareExerciseContentWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"course/courseware/exercise/list/get?courseware=%@", coursewareId];

    [self getContentWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/course/courseware/exercise/getscore/2?uid=10&t=49832AA1628239C5
- (void)getCoursewareScoringAverageWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"course/courseware/exercise/getscore/%@?", courseId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 [dataWrapper.modelList addObject:attributes];
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

// http://192.168.100.48:9092/rest/v1/course/courseware/track/open?uid=7&course=4&courseware=8&includeExercise=0
// exercise 是否有习题
- (void)trackCoursewareWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    includeExerciseId:(NSString *)includeExerciseId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/course/courseware/track/open?course=%@&courseware=%@&includeExercise=%@", courseId, coursewareId, includeExerciseId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

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
