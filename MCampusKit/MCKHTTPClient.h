//
//  APIClient.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "AFNetworking.h"

typedef void (^EXKHTTPClientSuccess)(AFJSONRequestOperation *operation, id responseObject);
typedef void (^EXKHTTPClientFailure)(AFJSONRequestOperation *operation, NSError *error);

@interface MCKHTTPClient : AFHTTPClient

+ (MCKHTTPClient *)sharedClient;;

@end


