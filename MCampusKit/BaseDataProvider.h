//
//  BaseDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDataWrapper.h"
#import "UIKit/UIKit.h"
#import "AFHTTPRequestOperation.h"

@interface BaseDataProvider : NSObject

// Get the all objects / Object json data from API.
- (void)getContentsWithPath:(NSString *)path
                  paramters:(NSDictionary *)parameters
                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getSystemContentWithPath:(NSString *)path
                       paramters:(NSDictionary *)parameters
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getObjectsWithPath:(NSString *)path
                 paramters:(NSDictionary *)parameters
                   success:(void (^)(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getSystemObjectsWithPath:(NSString *)path
                 paramters:(NSDictionary *)parameters
                   success:(void (^)(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject))success
                   failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;


- (void)getContentWithTokenPath:(NSString *)path
                      paramters:(NSDictionary *)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getContentWithTokenPaths:(NSArray *)paths
                       paramters:(NSDictionary *)parameters
                         success:(void (^)(NSArray *operations))success
                         failure:(void (^)(NSError *error))failure;

- (void)getObjectsWithTokenPath:(NSString *)path
                      paramters:(NSDictionary *)parameters
                        success:(void (^)(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)getSystemObjectsWithTokenPath:(NSString *)path
                            paramters:(NSDictionary *)parameters
                              success:(void (^)(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id responseObject))success
                              failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

- (void)saveObjectWithPath:(NSString *)path
                parameters:(NSDictionary *)params
                completion:(void (^)(id jsonData))block;

- (void)saveObjectWithMultiHeaderAndPath:(NSString *)path
                              parameters:(NSDictionary *)params
                              completion:(void (^)(id jsonData))completionBlock;


- (void)saveObjectWithPath:(NSString *)path
                parameters:(NSDictionary *)params
                 imageData:(NSData *)imageData
                  progress:(void (^)(CGFloat progress))progressBlock
                completion:(void (^)(BOOL success, NSError *error, id jsonData))completionBlock;

- (void)updateObjectWithPath:(NSString *)path
                  parameters:(NSDictionary *) params
                  completion:(void (^)(BOOL))block;

- (void)deleteObjectWithPath:(NSString *)path
                  completion:(void (^)(BOOL))block;

@end
