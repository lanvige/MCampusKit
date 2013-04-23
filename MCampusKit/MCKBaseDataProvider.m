//
//  BaseDataProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"
#import "MCKHTTPClient.h"
#import "AFNetworking.h"
#import "Reachability.h"
#import "MCKCustomError.h"
#import "MCKError.h"
#import "MCKUser.h"

// Set AFN timeout
// http://stackoverflow.com/questions/8304560/how-to-set-a-timeout-with-afnetworking

@implementation MCKBaseDataProvider

#pragma mark -
#pragma mark Get without Token

// Get object with json.
- (void)getContentsWithPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientSuccess)success
    failure:(MCKHTTPClientFailure)failure
{
    // encode url fix chinese issue.
    path = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

//    if (![[NetworkReachabilityManager sharedInstance] isNetworkReachability]) {
//
//        // Check network:
//        if (failure) {
//            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
//            [errDict setValue:@"网络不可用..." forKey:NSLocalizedDescriptionKey];
//            NSError *err = [NSError errorWithDomain:MCCustomErrorDomain code:MCSystemError userInfo:errDict];
//
//            failure(nil, err);
//
//            return;
//        }
//    }

    NSMutableURLRequest *request = [[MCKHTTPClient sharedClient] requestWithMethod:@"GET"
                                                                              path:path
                                                                        parameters:parameters];
    [request setTimeoutInterval:20];

    AFHTTPRequestOperation *operation = [[MCKHTTPClient sharedClient]
                                         HTTPRequestOperationWithRequest:request
                                                                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                             // Mapping JSON data to Data Module Objects
                                             NSLog(@"GET SUCCESS - %s ", __PRETTY_FUNCTION__);

                                             if (success) {
                                                 success((AFJSONRequestOperation *) operation, responseObject);
                                             }
                                         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             NSLog(@"GET ERROR - %@", error);

                                             if (failure) {
                                                 failure((AFJSONRequestOperation *) operation, error);
                                             }
                                         }];

    [[MCKHTTPClient sharedClient] enqueueHTTPRequestOperation:operation];
}


- (void)getObjectsWithPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure
{
    [self getContentsWithPath:path
                    paramters:parameters
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
         MCKDataWrapper *dataWrapper = [[MCKDataWrapper alloc] init];
         [dataWrapper unpackDictionary:responseObject];

         id jsonData = [responseObject safeObjectForKey:@"data"];

         if (dataWrapper.isSuccess) {
             if ([jsonData isEqual:@"0"]) {
                 NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
                 [errDict setValue:@"Unkonw server issue" forKey:NSLocalizedDescriptionKey];
                 NSError *error = [NSError errorWithDomain:MCKCustomErrorDomain code:MCKSystemError userInfo:errDict];

                 if (failure) {
                     failure((AFJSONRequestOperation *) operation, error);
                 }
             } else if (success) {
                 success(operation, dataWrapper, jsonData);
             }
         } else {
             if (failure) {
                 NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
                 [errDict setValue:dataWrapper.error.message forKey:NSLocalizedDescriptionKey];
                 NSError *error = [NSError errorWithDomain:MCKCustomErrorDomain code:MCKSystemError userInfo:errDict];

                 failure((AFJSONRequestOperation *) operation, error);
             }
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure((AFJSONRequestOperation *) operation, error);
         }
     }];
}

#pragma mark -
#pragma mark Get with Token

- (void)getContentWithTokenPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientSuccess)success
    failure:(MCKHTTPClientFailure)failure
{
    MCKUser *currentUser = [MCKUser currentUser];

    if (!currentUser) {
        if (failure) {
            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
            [errDict setValue:@"当前登陆失效，请重新登陆" forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:MCKCustomErrorDomain code:MCKSystemError userInfo:errDict];
            failure(nil, error);
        }

        return;
    }

    path = [path stringByAppendingString:[NSString stringWithFormat:@"&client=2&uid=%@&t=%@", currentUser.mId, currentUser.accessToken]];

    [self getContentsWithPath:path
                    paramters:parameters
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (success) {
             success((AFJSONRequestOperation *) operation, responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure((AFJSONRequestOperation *) operation, error);
         }
     }];
}

// Multi requests at once
- (void)getContentWithTokenPaths:(NSArray *)paths
    paramters:(NSDictionary *)parameters
    success:(void (^)(NSArray *operations))success
    failure:(void (^)(NSError *error))failure
{
    // Network check
//    if (![[NetworkReachabilityManager sharedInstance] isNetworkReachability]) {
//
//        // Check network:
//        if (failure) {
//            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
//            [errDict setValue:@"网络不可用..." forKey:NSLocalizedDescriptionKey];
//            NSError *err = [NSError errorWithDomain:MCCustomErrorDomain code:MCSystemError userInfo:errDict];
//            failure(err);
//
//            return;
//        }
//    }

    MCKUser *currentUser = [MCKUser currentUser];

    if (!currentUser) {
        if (failure) {
            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
            [errDict setValue:@"当前登陆失效，请重新登陆" forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:MCKCustomErrorDomain code:MCKSystemError userInfo:errDict];
            failure(error);
        }

        return;
    }

    // Add common path.
    NSMutableArray *requests = [[NSMutableArray alloc] init];

    for (NSString *path in paths) {
        NSString *pathWithToken = [[path stringByAppendingString:[NSString stringWithFormat:@"&client=2&uid=%@&t=%@", currentUser.mId, currentUser.accessToken]] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSMutableURLRequest *request = [[MCKHTTPClient sharedClient] requestWithMethod:@"GET" path:pathWithToken parameters:parameters];
        [requests addObject:request];
        [request setTimeoutInterval:10];
    }

    [[MCKHTTPClient sharedClient] enqueueBatchOfHTTPRequestOperationsWithRequests:requests
                                                                    progressBlock:^(NSUInteger numberOfFinishedOperations, NSUInteger totalNumberOfOperations) {
     } completionBlock:^(NSArray *operations) {
         if (success) {
             success(operations);
         }
     }];
}

- (void)getObjectsWithTokenPath:(NSString *)path
    paramters:(NSDictionary *)parameters
    success:(MCKHTTPClientWrapperSuccess)success
    failure:(MCKHTTPClientFailure)failure
{
    MCKUser *currentUser = [MCKUser currentUser];

    if (!currentUser) {
        if (failure) {
            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
            [errDict setValue:@"当前登陆失效，请重新登陆" forKey:NSLocalizedDescriptionKey];
            NSError *error = [NSError errorWithDomain:MCKCustomErrorDomain code:MCKSystemError userInfo:errDict];
            failure(nil, error);
        }

        return;
    }

    path = [path stringByAppendingString:[NSString stringWithFormat:@"&client=2&uid=%@&t=%@", currentUser.mId, currentUser.accessToken]];
    [self getObjectsWithPath:path
                   paramters:parameters
                     success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (success) {
             success((AFJSONRequestOperation *) operation, dataWrapper, jsonData);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure((AFJSONRequestOperation *) operation, error);
         }
     }];
}

#pragma mark -
#pragma mark Save methods

- (void)saveObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    completion:(void (^)(id jsonData))block
{

    [[MCKHTTPClient sharedClient] postPath:path
                                parameters:params
                                   success:^(AFHTTPRequestOperation *operation, id response) {
         NSLog(@"SAVE SUCCESS - %s ", __PRETTY_FUNCTION__);

         if (block) {
             block(response);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"SAVE ERROR - %@", error);
     }];
}

- (void)saveObjectWithMultiHeaderAndPath:(NSString *)path
    parameters:(NSDictionary *)params
    completion:(void (^)(id jsonData))completionBlock
{
    NSMutableURLRequest *postRequest = [[MCKHTTPClient sharedClient]
                                        multipartFormRequestWithMethod:@"POST"
                                                                  path:path
                                                            parameters:params
                                             constructingBodyWithBlock: ^(id formData) {
//                   NSMutableDictionary *headers = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//                                                   @"application/x-www-form-urlencoded; charset=UTF-8",@"Content-Type",
//                                                   [NSString stringWithFormat:@"form-data; name=\"%@\"", @"usr_info"],@"Content-Disposition"
//                                                   , nil];
//                   [formData appendPartWithHeaders:headers body:];
                                        }];

    AFJSONRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:postRequest];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (completionBlock) {
             completionBlock(responseObject);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         // failure :(
         // completionBlock([NSDictionary dictionaryWithObject:[error localizedDescription] forKey:@"error"]);
     }];

    [operation start];
}


- (void)saveObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    imageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    completion:(void (^)(BOOL success, NSError *error, id jsonData))completionBlock
{

    // Network check
//    if (![[NetworkReachabilityManager sharedInstance] isNetworkReachability]) {
//        // Check network:
//        if (completionBlock) {
//            NSMutableDictionary *errDict = [NSMutableDictionary dictionary];
//            [errDict setValue:@"网络不可用..." forKey:NSLocalizedDescriptionKey];
//            NSError *err = [NSError errorWithDomain:MCCustomErrorDomain code:MCSystemError userInfo:errDict];
//            completionBlock(FALSE, err, nil);
//
//            return;
//        }
//    }

    NSURLRequest *postRequest = [[MCKHTTPClient sharedClient]
                                 multipartFormRequestWithMethod:@"POST"
                                                           path:path
                                                     parameters:params
                                      constructingBodyWithBlock:^(id < AFMultipartFormData > formData) {
                                     if (imageData) {
                                         [formData appendPartWithFileData:imageData name:@"file"
                                                                 fileName:@"imagefile"
                                                                 mimeType:@"image/jpeg"];
                                     }
                                 }];

    AFHTTPRequestOperation *operation = [[AFJSONRequestOperation alloc] initWithRequest:postRequest];

    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
         CGFloat progress = ((CGFloat) totalBytesWritten) / totalBytesExpectedToWrite;
         progressBlock(progress);
     }];

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
         if (operation.response.statusCode == 200 || operation.response.statusCode == 201) {
             NSLog(@"Created, %@", responseObject);
             completionBlock(YES, nil, responseObject);
         } else {
             completionBlock(NO, nil, nil);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         completionBlock(NO, error, nil);
     }];

    [[MCKHTTPClient sharedClient] enqueueHTTPRequestOperation:operation];
}


#pragma mark -
#pragma mark Update

- (void)updateObjectWithPath:(NSString *)path
    parameters:(NSDictionary *)params
    completion:(void (^)(BOOL))block
{
    [[MCKHTTPClient sharedClient] putPath:path
                               parameters:params
                                  success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"UPDATE SUCCESS - %s", __PRETTY_FUNCTION__);

         if (block) {
             block(TRUE);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"UPDATE ERROR -%@", error);

         if (block) {
             block(FALSE);
         }
     }];
}


#pragma mark -
#pragma mark Delete

- (void)deleteObjectWithPath:(NSString *)path
    completion:(void (^)(BOOL))block
{
    [[MCKHTTPClient sharedClient] deletePath:path
                                  parameters:nil
                                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSLog(@"DELETE SUCCESS - %s", __PRETTY_FUNCTION__);
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"DELETE ERROR - %@", error);
     }];
}

@end
