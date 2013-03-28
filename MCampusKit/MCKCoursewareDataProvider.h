//
//  CoursewareDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@interface MCKCoursewareDataProvider : MCKBaseDataProvider

- (void)getCoursewaresWithCourse:(NSString *)courseId
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewaresWithCourse:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewaresWithCourseIdV2:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewareContentWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    success:(void (^)(id jsonData))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewareFrameInfoWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewareCommentsContentWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(id jsonData))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewareExerciseContentWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure;

- (void)trackCoursewareWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    includeExerciseId:(NSString *)includeExerciseId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursewareScoringAverageWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;


@end
