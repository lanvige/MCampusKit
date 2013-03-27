//
//  LTDialogue.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
// 消息中心 - 私信

#import "MCKModelBaseIdentifier.h"

@interface MCKDialogue : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userIcon;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger messageCount;
@property (nonatomic, assign) NSInteger unreadedMsgCount;
@property (nonatomic, strong) NSString *updatetime;
@property (nonatomic, assign) NSInteger hasNewMessage;
@property (nonatomic, strong) NSString *updateTimestamp;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
