//
//  ProgressDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKBaseDataProvider.h"

@interface MCKProgressDataProvider : MCKBaseDataProvider

- (void)getCourseRankingWithCourseId:(NSString *)courseId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;

- (void)getProgressWithCourseId:(NSString *)courseId
    pageIndex:(NSInteger)pageIndex
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure;
@end
