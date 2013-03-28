//
//  ExecriseDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 1/21/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@interface MCKExecriseDataProvider : MCKBaseDataProvider

- (void)getExecriseWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)postExecriseWithCoursewareId:(NSString *)coursewareId
    answer:(NSString *)answer
    success:(void (^)(BOOL result))success
    failure:(void (^)(NSError *))failure;

- (void)getFriendsDidTheExecriseWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure;

- (void)getHighestScoreWithCoursewareId:(NSString *)coursewareId
    success:(void (^)(MCKDataWrapper *))success
    failure:(void (^)(NSError *))failure;
@end
