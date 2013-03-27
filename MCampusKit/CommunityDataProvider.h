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

@interface CommunityDataProvider : MCKBaseDataProvider

- (void)getTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    latestType:(NSString *)latestType
    courseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getFreshTopicsWithTags:(NSString *)tags
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getUpdateTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMoreTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getTopicWithTopicId:(NSString *)topicId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getTopicsWithUserId:(NSString *)userId
    pageNumber:(NSString *)pageNumber
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

// http://192.168.100.48:9092/rest/v1/sns/topics?schools=1,2,164,&start=0&tag=&getlatest=1&uid=154&course=&courseware=&user=&t=195476BCBAF949E7&client=1
- (void)getTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;


- (void)addTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    tags:(NSString *)tags
    content:(NSString *)content
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
