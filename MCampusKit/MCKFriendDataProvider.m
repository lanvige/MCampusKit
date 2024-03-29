//
//  FriendDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/12/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFriendDataProvider.h"

#import "MCKDataWrapper.h"
#import "MCKHTTPClient.h"
#import "MCKFriend.h"
#import "MCKFriendVt.h"

@implementation MCKFriendDataProvider

// http://222.66.33.210:9092/rest/v1/friend/myfriend/get?uid=39&from=0&t=F0B09E1537ACCA3A
- (void)getFriendsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/friend/myfriend/get?from=0"];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             NSArray *friendsArray = (NSArray *) jsonData;
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[friendsArray count]];

             for (NSDictionary * friendDict in friendsArray) {
                 MCKFriend *friend = [[MCKFriend alloc] init];
                 [friend unpackDictionary:friendDict];
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

// http://192.168.100.48:9092/rest/v1/t/friend/list?uid=5&from=&t=89D8FA86DDE18B59&client=3
- (void)getFriendsVtWithSuccess:(void (^)(MCKDataWrapper *))success failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/friend/list?from="];
    
    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
                              if (jsonData) {
                                  NSArray *friendsArray = (NSArray *) jsonData;
                                  dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[friendsArray count]];
                                  
                                  for (NSDictionary * friendDict in friendsArray) {
                                      MCKFriendVt *friend = [[MCKFriendVt alloc] init];
                                      [friend unpackDictionary:friendDict];
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

// http://192.168.100.48:9092/rest/v1/friend/myfriend/12/get?uid=39&from=0&t=F0B09E1537ACCA3A
- (void)getFriendsWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/friend/myfriend/%@/get?", friendId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             NSArray *friendList = (NSArray *) jsonData;
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[friendList count]];

             for (NSDictionary * attributes in friendList) {
                 MCKFriend *friend = [[MCKFriend alloc] init];
                 [friend unpackDictionary:jsonData];
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


// {
// data: 1,
// error: null,
// isSuccess: true,
// timestamp: "1350367666731"
// }
// http://192.168.100.48:9092/rest/v1/friend/invitation/send?uid=12&friend=13
- (void)addFriendWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/friend/invitation/send?friend=%@", friendId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         //
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

// http://192.168.100.48:9092/rest/v1/friend/invitation/accept?uid=12&friend=13
- (void)acceptFriendRequestWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/friend/invitation/accept?friend=%@", friendId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             MCKFriend *friend = [[MCKFriend alloc] init];
             [friend unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:friend];
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

// 拒绝好友请求http://192.168.100.48:9092/rest/v1/friend/invitation/ignore?uid=12&friend=13
- (void)ignoreFriendRequestWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{

    NSString *path = [NSString stringWithFormat:@"v1/friend/invitation/ignore?friend=%@", friendId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         NSString *result = (NSString *) jsonData;
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:result];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// Data model.
// {
// data: 1,
// error: null,
// isSuccess: true,
// timestamp: "1350358710589"
// }
// http://222.66.33.210:9092/rest/v1/friend/invitation/relieve?uid=39&friend=29&t=F0B09E1537ACCA3A
- (void)relieveFriendWithFriendId:(NSString *)friendId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/friend/invitation/relieve?friend=%@", friendId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         NSString *result = (NSString *) jsonData;
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:result];

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
