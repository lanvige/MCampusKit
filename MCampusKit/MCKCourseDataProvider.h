//
//  CourseDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@class MCKDataWrapper;

@interface MCKCourseDataProvider : MCKBaseDataProvider

- (void)getCoursesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getCourseVtWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getCoursesWithUserId:(NSString *)userId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

// 顶课程
- (void)supportCourseWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

// 课程评星
- (void)ratingCourseWithCourseId:(NSString *)courseId
    star:(NSInteger)star
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

@end
