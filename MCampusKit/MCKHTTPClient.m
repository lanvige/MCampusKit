//
//  APIClient.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKHTTPClient.h"
#import "MCKDefines.h"
#import "AFNetworking.h"

@implementation MCKHTTPClient {
    dispatch_queue_t _callbackQueue;
}

+ (MCKHTTPClient *)sharedClient
{
    static MCKHTTPClient *sharedClient = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
                      sharedClient = [[self alloc] init];
                  });
    return sharedClient;
}


#pragma mark -
#pragma mark NSObject

- (id)init
{
    NSURL *base = [NSURL URLWithString:kMCKAPIHost];

    if ((self = [super initWithBaseURL:base])) {
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
        // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
        [self setDefaultHeader:@"Accept" value:@"application/json"];
        _callbackQueue = dispatch_queue_create("com.lantop.mcampus.network-callback-queue", 0);
    }

    return self;
}

- (void)dealloc
{
    MCKDispatchRelease(_callbackQueue);
}


#pragma mark -
#pragma mark - AFHTTPClient

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(NSDictionary *)parameters
{
    NSMutableURLRequest *request = [super requestWithMethod:method
                                                       path:path
                                                 parameters:parameters];
    
    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    return request;
}

// setup complete block use sam thred
- (void)enqueueHTTPRequestOperation:(AFHTTPRequestOperation *)operation
{
    operation.successCallbackQueue = _callbackQueue;
    operation.failureCallbackQueue = _callbackQueue;
    [super enqueueHTTPRequestOperation:operation];
}

@end