//
//  NoticeDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
//  通知

#import "MCKBaseDataProvider.h"

@interface NoticeDataProvider : MCKBaseDataProvider

- (void)getNoticesWithNoticeId:(NSString *)noticeId
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getFreshNoticesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getUpdateNoticesWithLatestNoticeId:(NSString *)latestNoticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMoreNoticesWithLastNoticeId:(NSString *)lastNoticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)setNoticeAsReadedWithNoticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)replyTopicWithNoticeId:(NSString *)noticeId
    receiverId:(NSString *)receiverId
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)fowardTopicWithNoticeId:(NSString *)noticeId
    friendsId:(NSString *)friendsId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMmsWithMmsId:(NSString *)mmsId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMMSContentWithMmsId:(NSString *)mmsId
    success:(void (^)(id jsonData))success
    failure:(void (^)(NSError *error))failure;

- (void)getVoteWithNoticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)voteWithVoteId:(NSString *)voteId
    option:(NSString *)option
    noticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

@end