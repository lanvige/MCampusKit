//
//  APIClient.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "AFNetworking.h"
@class MCKDataWrapper;

// CDKDispatchRelease
typedef void (^MCKHTTPClientSuccess)(AFJSONRequestOperation *operation, id responseObject);
typedef void (^MCKHTTPClientWrapperSuccess)(AFHTTPRequestOperation *operation,
    MCKDataWrapper *dataWrapper, id responseObject);
typedef void (^MCKHTTPClientFailure)(AFJSONRequestOperation *operation, NSError *error);

@interface MCKHTTPClient : AFHTTPClient

+ (MCKHTTPClient *)sharedClient;
+ (id)initWithPrefixURL:(NSString *)url;

@end


