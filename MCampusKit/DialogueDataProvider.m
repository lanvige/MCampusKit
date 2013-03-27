//
//  DialogueDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "DialogueDataProvider.h"

#import "MCKHTTPClient.h"
#import "MCKDataWrapper.h"
#import "MCKDialogue.h"
#import "MCKDialogueDetail.h"

@implementation DialogueDataProvider


// http://222.66.33.210:9092/rest/v1/msg/ios/dialogue/list/get?uid=39&t=F0B09E1537ACCA3A&start=0&getlatest=1
- (void)getDialoguesWithTimestamp:(NSString *)timestamp
    latestType:(NSString *)latestType
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/ios/dialogue/list/get?&start=%@&getlatest=%@", timestamp, latestType];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if ([jsonData isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKDialogue *dialogue = [[MCKDialogue alloc] init];
                 [dialogue unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:dialogue];
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
- (void)getFreshDialoguesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getDialoguesWithTimestamp:@""
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
- (void)getUpdateDialoguesWithTimestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getDialoguesWithTimestamp:timestamp
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
- (void)getMoreDialoguesWithTimestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getDialoguesWithTimestamp:timestamp
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


// http://222.66.33.210:9092/rest/v1/msg/dialogue/get?uid=39&fuid=1&from=&t=F0B09E1537ACCA3A
// Service Error
- (void)getDialogueWithUserId:(NSString *)userId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/dialogue/get?fuid=%@&from=", userId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary *attributes in jsonData) {
                 MCKDialogueDetail *dialogue = [[MCKDialogueDetail alloc] init];
                 [dialogue unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:dialogue];
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

// http://222.66.33.210:9092/rest/v1/msg/dialogue/sendtext?sid=39&rids=12&content=test&t=F0B09E1537ACCA3A
- (void)sendDialogueWithSid:(NSString *)sid
    rid:(NSString *)rid
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/msg/dialogue/sendtext?sid=%@&rids=%@&content=%@", sid, rid, content];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];

             if (jsonData) {
                 MCKDialogueDetail *dialog = [[MCKDialogueDetail alloc] init];
                 [dialog unpackDictionary:jsonData];
                 [[dataWrapper modelList] addObject:dialog];
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

// POST - http://222.66.33.210:9092/rest/v1/msg/dialogue/send?
// public JsonResult<PrivateMessage> sendMessage(
// @FormDataParam("file") InputStream uploadedInputStream,
// @FormDataParam("file") FormDataContentDisposition fileDetail,
// @FormDataParam("sid") int senderId,
// @FormDataParam("rids") String receiverIds,
// @FormDataParam("content") String content,
// @FormDataParam("t") String token);
- (void)sendDialogueWithSid:(NSString *)sid
    rid:(NSString *)rid
    content:(NSString *)content
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(MCKDataWrapper *, NSError *))completionBlock
{

    NSString *path = @"v1/msg/dialogue/send";

    NSDictionary *params = @{
// FIXME:
//    @"sid" :CACHE.context.mId,
        @"rids" :rid,
        @"content" :content,
//    @"uid" : CACHE.context.mId,
//    @"t" : CACHE.context.token,
    };

    [self saveObjectWithPath:path
                  parameters:params
                   imageData:imageData
                    progress:^(CGFloat progress) {
         if (progressBlock) {
             progressBlock(progress);
         }
     }
                  completion:^(BOOL success, NSError *error, id jsonData) {
         MCKDataWrapper *dataWrapper = [[MCKDataWrapper alloc] init];
         [dataWrapper unpackDictionary:jsonData];

         // TODO what's the return.
         if (completionBlock) {
             completionBlock(dataWrapper, error);
         }
     }];
}


@end
