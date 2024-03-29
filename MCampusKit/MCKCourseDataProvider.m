//
//  CourseDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCourseDataProvider.h"

#import "MCKHTTPClient.h"
#import "MCKCourse.h"

@implementation MCKCourseDataProvider

// http://svc.ydxy.cn/rest/v2/course/list/get?from=&client=2&uid=3&t=F3CD921D2CA61426
- (void)getCoursesWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/list/get?"];
    
    [self getObjectsWithTokenPath:path paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
                              
                              if (jsonData) {
                                  //                                  NSArray *courseList = (NSArray *)jsonData;
                                  dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];
                                  
                                  for (NSDictionary * attributes in jsonData) {
                                      MCKCourse *course = [[MCKCourse alloc] init];
                                      [course unpackDictionary:attributes];
                                      [dataWrapper.modelList addObject:course];
                                  }
                              } else {
                                  dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
                              }
                              
                              if (success) {
                                  success(dataWrapper);
                              }
                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              failure(error);
                          }];
}

// http://192.168.100.48:9092/rest/v1/t/course/list?uid=12&from=&t=C6EA77605626FC74
- (void)getCourseVtWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
                       failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/t/course/list?"];
    
    [self getObjectsWithTokenPath:path paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
                              
                              if (jsonData) {
                                  dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];
                                  
                                  for (NSDictionary * attributes in jsonData) {
                                      MCKCourse *course = [[MCKCourse alloc] init];
                                      [course unpackDictionary:attributes];
                                      [dataWrapper.modelList addObject:course];
                                  }
                              } else {
                                  dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
                              }
                              
                              if (success) {
                                  success(dataWrapper);
                              }
                          } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                              failure(error);
                          }];
}

// http://192.168.100.48:9092/rest/v2/course/list/get?uid=3&from=&t=F3CD921D2CA61426&client=1
- (void)getCoursesWithUserId:(NSString *)userId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{

    NSString *path = [NSString stringWithFormat:@"v2/course/list/get?uid=%@&from=", userId];

    [self getObjectsWithTokenPath:path paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         if (jsonData) {
             //                                  NSArray *courseList = (NSArray *)jsonData;
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:[jsonData count]];

             for (NSDictionary * attributes in jsonData) {
                 MCKCourse *course = [[MCKCourse alloc] init];
                 [course unpackDictionary:attributes];
                 [dataWrapper.modelList addObject:course];
             }
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
}

// http://222.66.33.210:9092/rest/v1/course/support?uid=39&course=2&t=F0B09E1537ACCA3A
- (void)supportCourseWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/course/support?course=%@", courseId];

    [self getObjectsWithTokenPath:path paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         //                              NSString *result = (NSString *)jsonData;
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
}

// http://192.168.100.48:9092/rest/v2/course/comment?course=12&star=4&uid=39&t=F0B09E1537ACCA3A
- (void)ratingCourseWithCourseId:(NSString *)courseId
    star:(NSInteger)star
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v2/course/comment?course=%@&star=%d", courseId, star];

    [self getObjectsWithTokenPath:path paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         //                              NSString *result = (NSString *)jsonData;
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         failure(error);
     }];
}

@end
