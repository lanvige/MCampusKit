//
//  LTProfileStudyDetail.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKProfileStudyDetail : MCKModelBase

@property (nonatomic, assign) NSInteger friendCount;
@property (nonatomic, assign) NSInteger courseCount;
@property (nonatomic, assign) NSInteger discussionCount;
@property (nonatomic, assign) NSInteger privateMsgCount;
@property (nonatomic, assign) BOOL isMyFriend;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
