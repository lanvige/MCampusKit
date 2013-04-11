//
//  TopicDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKBaseDataProvider.h"

// 讨论数据存取

@class MCKDataWrapper;

@interface MCKCommunityDataProvider : MCKBaseDataProvider

// - (void)getTopicsWithTags:(NSString *)tags
//    timestamp:(NSString *)timestamp
//    latestType:(NSString *)latestType
//    courseId:(NSString *)courseId
//    coursewareId:(NSString *)coursewareId
//    schoolIds:(NSString *)schoolIds
//    success:(void (^)(MCKDataWrapper *dataWrapper))success
//    failure:(void (^)(NSError *error))failure;

#pragma mark - list
- (void)getTopicsWithSchools:(NSString *)schools
    timestamp:(NSString *)timestamp
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getFreshTopicsWithSchools:(NSString *)schools
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getUpdateTopicsWithSchools:(NSString *)schools
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMoreTopicsWithSchools:(NSString *)schools
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

#pragma mark - list 2
- (void)getTopicsWithUserId:(NSString *)userId
    pageNumber:(NSString *)pageNumber
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getTopicsWithCourseId:(NSString *)courseId
    timestamp:(NSString *)timestamp
    schoolIds:(NSString *)schoolIds
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getTopicsWithCoursewareId:(NSString *)coursewareId
    timestamp:(NSString *)timestamp
    schoolIds:(NSString *)schoolIds
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

#pragma mark -

- (void)getTopicWithTopicId:(NSString *)topicId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)addTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    tags:(NSString *)tags
    content:(NSString *)content
    schools:(NSString *)schools
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(MCKDataWrapper *, NSError *))completionBlock;

// - (void)addTopicsWithCourseId:(NSString *)courseId
//    coursewareId:(NSString *)coursewareId
//    tags:(NSString *)tags
//    content:(NSString *)content
//    success:(void (^)(MCKDataWrapper *dataWrapper))success
//    failure:(void (^)(NSError *error))failure;

- (void)replyTopicWithTopicId:(NSString *)topicId
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)reportTopicWithTopicId:(NSString *)topicId
    type:(NSString *)type
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)deleteTopicWithTopicId:(NSString *)topicId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

@end
