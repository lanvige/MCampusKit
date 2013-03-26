//
//  NoticationDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "BaseDataProvider.h"

@interface NoticationDataProvider : BaseDataProvider

- (void)getNoticationsWithNoticationId:(NSString *)noticationId
                            latestType:(NSString *)latestType
                               success:(void (^)(MCKDataWrapper *dataWrapper))success
                               failure:(void (^)(NSError *error))failure;

- (void)getFreshNoticationsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
                               failure:(void (^)(NSError *error))failure;

- (void)getUpdateNoticationsWithNoticationId:(NSString *)noticationId
                                     success:(void (^)(MCKDataWrapper *dataWrapper))success
                                     failure:(void (^)(NSError *error))failure;

- (void)getMoreNoticationsWithNoticationId:(NSString *)noticationId
                                   success:(void (^)(MCKDataWrapper *dataWrapper))success
                                   failure:(void (^)(NSError *error))failure;
@end
