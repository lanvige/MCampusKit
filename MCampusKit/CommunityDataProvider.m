//
//  TopicDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "CommunityDataProvider.h"

#import "MCKHTTPClient.h"
#import "MCKDataWrapper.h"
#import "MCKUserContext.h"
#import "MCKCommunity.h"
#import "MCKConfiguration.h"

@implementation CommunityDataProvider

// http://222.66.33.210:9092/rest/v1/sns/topics?schools=1%2C2%2C&start=0&&tag=&t=F0B09E1537ACCA3A&getlatest=1
- (void)getTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    latestType:(NSString *)latestType
    courseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    // FIXME:
    NSString *mySchools = @"";

    // NSString *mySchools = [(MCKConfiguration *) [CACHEMANAGER restore:kConfigurationCacheKey] mySchoolIds];

    NSLog(@"%@", mySchools);
    NSString *path = [NSString stringWithFormat:@"v1/sns/topics?schools=%@&tag=%@&getlatest=%@&start=%@&course=%@&courseware=%@", mySchools, tags, latestType, timestamp, courseId, coursewareId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         //
         if (jsonData != [NSNull null]) {
             NSArray *topicList = [jsonData objectForKey:@"topics"];

             //                                  if ([topicList isKindOfClass:[NSArray class]]) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[topicList count]];

             for (NSDictionary * attributes in topicList) {
                 MCKCommunity *topic = [[MCKCommunity alloc] init];
                 [topic unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:topic];
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

- (void)getFreshTopicsWithTags:(NSString *)tags
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTopicsWithTags:tags timestamp:@"" latestType:@"1" courseId:@"" coursewareId:@"" success:^(MCKDataWrapper *dataWrapper) {
         //
         if (success) {
             success(dataWrapper);
         }
     } failure:^(NSError *error) {
         //
         if (failure) {
             failure(error);
         }
     }];
}

- (void)getUpdateTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTopicsWithTags:tags
                  timestamp:timestamp
                 latestType:@"1"
                   courseId:@""
               coursewareId:@""
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

- (void)getMoreTopicsWithTags:(NSString *)tags
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTopicsWithTags:tags
                  timestamp:timestamp
                 latestType:@"0"
                   courseId:@""
               coursewareId:@""
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

// http://192.168.100.48:9092/rest/v1/sns/topics?schools=1,2,164,&start=0&tag=&getlatest=1&uid=154&course=&courseware=&user=&t=195476BCBAF949E7&client=1
- (void)getTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    timestamp:(NSString *)timestamp
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    [self getTopicsWithTags:@""
                  timestamp:timestamp
                 latestType:@"0"
                   courseId:courseId
               coursewareId:coursewareId
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


// http://222.66.33.210:9092/rest/v1/sns/topic?uid=39&topic=10&t=F0B09E1537ACCA3A
- (void)getTopicWithTopicId:(NSString *)topicId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/sns/topic?topic=%@", topicId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKCommunity *topic = [[MCKCommunity alloc] init];
             [topic unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:topic];
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

// http://192.168.100.48:9092/rest/v1/sns/topics/404?uid=39&t=F0B09E1537ACCA3A&page=1
- (void)getTopicsWithUserId:(NSString *)userId
    pageNumber:(NSString *)pageNumber
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/sns/topics/%@?&page=%@", userId, pageNumber];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData != [NSNull null]) {
             NSArray *data = (NSArray *) jsonData;
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[data count]];

             for (NSDictionary * attributes in data) {
                 MCKCommunity *topic = [[MCKCommunity alloc] init];
                 [topic unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:topic];
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

// http://222.66.33.210:9092/rest/v1/sns/topic/add?uid=39&schools=1%2C2%2C&course=0&courseware=0&tags=&content=wt&t=F0B09E1537ACCA3A
- (void)addTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    tags:(NSString *)tags
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    // FIXME:
    NSString *mySchools = @"";
    // NSString *mySchools = [(MCConfiguration *) [CACHEMANAGER restore:kConfigurationCacheKey] mySchoolIds];
    NSString *path = [NSString stringWithFormat:@"v1/sns/topic/add?schools=%@&course=%@&courseware=%@&tags=%@&content=%@", mySchools, courseId, coursewareId, tags, content];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKCommunity *topic = [[MCKCommunity alloc] init];
             [topic unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:topic];
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

/*
   @FormDataParam("file") InputStream uploadedInputStream,
   @FormDataParam("file") FormDataContentDisposition fileDetail,
   @FormDataParam("uid") int userId, @FormDataParam("t") String token,
   @FormDataParam("schools") String schoolIds,
   @FormDataParam("course") int courseId,
   @FormDataParam("courseware") int coursewareId,
   @FormDataParam("tags") String tags,
   @FormDataParam("content") String content);
 */

- (void)addTopicsWithCourseId:(NSString *)courseId
    coursewareId:(NSString *)coursewareId
    tags:(NSString *)tags
    content:(NSString *)content
    schools:(NSString *)schools
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(MCKDataWrapper *, NSError *error))completionBlock
{

    NSString *path = @"v1/sns/topic/add/withpic";

    NSDictionary *params = @{
        @"course" :courseId,
        @"courseware" :coursewareId,
        @"content" :content,
        @"schools" :schools,
        @"tags"    :tags,
// FIXME:
//        @"uid" : CACHE.context.mId,
//        @"t" : CACHE.context.token,
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

         // TODO what's the return.
         if (completionBlock) {
             completionBlock(dataWrapper, error);

         }
     }];
}

// http://222.66.33.210:9092/rest/v1/sns/topic/reply?uid=39&topic=1&content=test&t=F0B09E1537ACCA3A
- (void)replyTopicWithTopicId:(NSString *)topicId
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/sns/topic/reply?topic=%@&content=%@", topicId, content];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData != [NSNull null]) {
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

// http://222.66.33.210:9092/rest/v1/sns/topic/feedback?uid={0}&topic={1}&type={2}&content={3}
- (void)reportTopicWithTopicId:(NSString *)topicId
    type:(NSString *)type
    content:(NSString *)content
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/sns/topic/feedback?topic=%@&type=%@&content=%@", topicId, type, content];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData != [NSNull null]) {
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

// 删除单条社区话题或回复
// http://192.168.100.193:8080/rest/v1/sns/topic/delete?&topic=1&uid=12&start=&tag=&t=F0B09E1537ACCA3A
- (void)deleteTopicWithTopicId:(NSString *)topicId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/sns/topic/delete?topic=%@", topicId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData != [NSNull null]) {
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

@end
