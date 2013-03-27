//
//  FriendDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/12/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@class MCKDataWrapper;

@interface FriendDataProvider : MCKBaseDataProvider

- (void)getFriendsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getFriendsWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)addFriendWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)acceptFriendRequestWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)ignoreFriendRequestWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)relieveFriendWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

@end