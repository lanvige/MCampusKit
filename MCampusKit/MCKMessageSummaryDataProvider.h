//
//  MessageSummaryDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@class MCKDataWrapper;

@interface MCKMessageSummaryDataProvider : MCKBaseDataProvider

- (void)getMessageSummaryWithTimestamp:(NSString *)timestamp
    schoolIds:(NSString *)schoolIds
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getMessageSummaryWithSchoolIds:(NSString *)schoolIds
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

@end
