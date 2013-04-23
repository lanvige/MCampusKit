//
//  NoticeDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
// 通知 数据存取层

#import "MCKNoticeDataProvider.h"
#import "MCKMms.h"
#import "MCKNotice.h"
#import "MCKVote.h"
#import "MCKOutboxNotice.h"
#import "MCKNoticeReply.h"
#import "MCKUser.h"

@implementation MCKNoticeDataProvider

// http://222.66.33.210:9092/rest/v1/msg/ios/notice/get?uid=39&fromid=0&getlatest=1&t=F0B09E1537ACCA3A&client=2
- (void)getNoticesWithNoticeId:(NSString *)noticeId
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/ios/notice/get?fromid=%@&getlatest=%@", noticeId, latestType];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if ([jsonData isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKNotice *notice = [[MCKNotice alloc] init];
                 [notice unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:notice];
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

// First time to get top 20 items.
- (void)getFreshNoticesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticesWithNoticeId:@""
                      latestType:@"1"
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

// Get new top ? items to current list
- (void)getUpdateNoticesWithLatestNoticeId:(NSString *)latestNoticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticesWithNoticeId:latestNoticeId
                      latestType:@"1"
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

// Get old 20 items to current list
- (void)getMoreNoticesWithLastNoticeId:(NSString *)lastNoticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getNoticesWithNoticeId:lastNoticeId
                      latestType:@"0"
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

#pragma mark -
#pragma mark SET read, reply, forward

// http://222.66.33.210:9092/rest/v1/msg/notice/read?uid=39&message=2184&t=F0B09E1537ACCA3A
- (void)setNoticeAsReadedWithNoticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/notice/read?message=%@", noticeId];

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

// http://222.66.33.210:9092/rest/v1/msg/notice/reply?message=&receiver=&content=&uid=39&t=F0B09E1537ACCA3A
- (void)replyTopicWithNoticeId:(NSString *)noticeId
    receiverId:(NSString *)receiverId
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/notice/reply?message=%@&receiver=%@&content=%@", noticeId, receiverId, content];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }

         ;
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/msg/notice/forward?friends=8,8&message=2181&client=2&uid=7&t=E43CAB58A742D34C
- (void)fowardTopicWithNoticeId:(NSString *)noticeId
    friendsId:(NSString *)friendsId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/notice/forward?friends=%@&message=%@", friendsId, noticeId];

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


#pragma mark -
#pragma mark MMS

// http://222.66.33.210:9092/rest/v1/msg/notice/mms/72?uid=39&t=F0B09E1537ACCA3A
- (void)getMmsWithMmsId:(NSString *)mmsId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/notice/mms/%@?", mmsId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKMms *message = [[MCKMms alloc] init];
             [message unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:message];

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

- (void)getMMSContentWithMmsId:(NSString *)mmsId
    success:(void (^)(id jsonData))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/notice/mms/%@?", mmsId];

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

#pragma mark -
#pragma mark Vote

// http://222.66.33.210:9092/rest/v1/msg/vote/get?message=1869&uid=39&t=F0B09E1537ACCA3A
- (void)getVoteWithNoticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/vote/get?message=%@", noticeId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKVote *vote = [[MCKVote alloc] init];
             [vote unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:vote];

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

// http://222.66.33.210:9092/rest/v1/msg/vote/submit?uid=3&vid=1309&option=A&message=1869
- (void)voteWithVoteId:(NSString *)voteId
    option:(NSString *)option
    noticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/vote/submit?vid=%@&option=%@&message=%@", voteId, option, noticeId];

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

#pragma mark -
#pragma mark 教师版接口

// http://192.168.100.48:9092/rest/v1/t/msg/outbox/list?uid=39&t=&getlatest=0&from=2068
- (void)getTeacherOutboxMessagesWithType:(NSString *)latestType
    from:(NSString *)from
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/msg/outbox/list?getlatest=%@&from=%@", latestType, from];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if ([jsonData isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKOutboxNotice *notice = [[MCKOutboxNotice alloc] init];
                 [notice unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:notice];
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

- (void)getFreshTeacherOutboxMessagesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTeacherOutboxMessagesWithType:@"1" from:@"" success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         failure(error);
     }];
}

- (void)getUpdateTeacherOutboxMessageFrom:(NSString *)fromId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTeacherOutboxMessagesWithType:@"1" from:fromId success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         failure(error);
     }];
}

- (void)getMoreTeacherOutboxMessageFrom:(NSString *)fromId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTeacherOutboxMessagesWithType:@"0" from:fromId success:^(MCKDataWrapper *dataWrapper) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         failure(error);
     }];
}

// http://192.168.100.48:9092/rest/v1/t/msg/outbox/delete/2047?uid=12&t=
- (void)deleteOutboxNoticeWithNoticeId:(NSString *)noticeId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/msg/outbox/delete/%@?", noticeId];

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

// http://192.168.100.48:9092/rest/v1/t/msg/outbox/message/748/reply/p1?uid=39&t=
- (void)getNoticeRepliesWithNoticeId:(NSString *)noticeId
                          pageNumber:(NSInteger)pageNumber
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/msg/outbox/message/%@/reply/p%d?", noticeId, pageNumber];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if ([jsonData isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKNoticeReply *notice = [[MCKNoticeReply alloc] init];
                 [notice unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:notice];
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


// http://192.168.100.48:9092/rest/v1/t/msg/schoolsandclasses?uid=12&t=
- (void)getMySchoolsAndClassesWithSuccess:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/msg/schoolsandclasses?"];

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


- (void)addNoticeWithClassId:(NSString *)classId
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = @"v1/sns/topic/add/withpic";

    MCKUser *currentUser = [MCKUser currentUser];

    NSDictionary *params = @{
        @"class" :classId,
        @"content" :content,
        @"uid" : currentUser.mId,
        @"t" : currentUser.accessToken
    };

    [self saveObjectWithPath:path
                  parameters:params
                     success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject) {
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:responseObject];

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
