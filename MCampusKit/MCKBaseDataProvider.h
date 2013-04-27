//
//  BaseDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDataWrapper.h"
#import "MCKHTTPClient.h"

@interface MCKBaseDataProvider : NSObject

- (void)getContentsWithPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientSuccess)success
    failure:(MCKHTTPClientFailure)failure;

- (void)getObjectsWithPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure;

- (void)getContentWithTokenPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientSuccess)success
    failure:(MCKHTTPClientFailure)failure;

- (void)getContentWithTokenPaths:(NSArray *)paths
    paramters:(NSDictionary *)parameters
    success:(void (^)(NSArray *operations))success
    failure:(void (^)(NSError *error))failure;

- (void)getObjectsWithTokenPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure;

- (void)saveObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure;

// Post base provider, because service settings, must use multiheader;
- (void)saveObjectWithMultiHeaderAndPath:(NSString *)path
    parameters:(NSDictionary *)params
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure;

- (void)saveObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(BOOL success, NSError *error, id jsonData))completionBlock;

- (void)updateObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    completion:(void (^)(BOOL))block;

- (void)deleteObjectWithPath:(NSString *)path
    completion:(void (^)(BOOL))block;

@end
