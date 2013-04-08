//
//  DialogueDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@class MCKDataWrapper;

@interface MCKDialogueDataProvider : MCKBaseDataProvider

- (void)getDialoguesWithTimestamp:(NSString *)timestamp
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

// First time to get top 20 items.
- (void)getFreshDialoguesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getUpdateDialoguesWithTimestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMoreDialoguesWithTimestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getDialogueWithUserId:(NSString *)userId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

//- (void)sendDialogueWithSid:(NSString *)sid
//    rid:(NSString *)rid
//    content:(NSString *)content
//    success:(void (^)(MCKDataWrapper *dataWrapper))success
//    failure:(void (^)(NSError *error))failure;

- (void)sendDialogueWithSid:(NSString *)sid
    rid:(NSString *)rid
    content:(NSString *)content
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(MCKDataWrapper *, NSError *))completionBlock;

@end
