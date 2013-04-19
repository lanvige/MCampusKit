//
//  MCKOutboxNotice.h
//  MCampusKit
//
//  Created by Lanvige Jiang on 4/19/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKOutboxNotice : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger receiveCount;
@property (nonatomic, assign) NSInteger signCount;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *senderName;
@property (nonatomic, strong) NSString *senderId;
@property (nonatomic, strong) NSString *senderIcon;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
