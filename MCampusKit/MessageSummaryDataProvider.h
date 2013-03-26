//
//  MessageSummaryDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseDataProvider.h"

@class MCKDataWrapper;

@interface MessageSummaryDataProvider : BaseDataProvider

- (void)getMessageSummaryWithTimestamp:(NSString *)timestamp
                               success:(void (^)(MCKDataWrapper *dataWrapper))success
                               failure:(void (^)(NSError *error))failure;

- (void)getMessageSummaryWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
                             failure:(void (^)(NSError *error))failure;

@end
