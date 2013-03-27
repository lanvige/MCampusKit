//
//  ETMessageSummary.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKMessageSummary : MCKModelBase

@property (nonatomic, assign) int newNoticeCount;
@property (nonatomic, assign) int newFriendMsgCount;
@property (nonatomic, assign) int newDiscussionCount;
@property (nonatomic, assign) int newSystemMsgCount;
@property (nonatomic, assign) int allNewMessageCount;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
