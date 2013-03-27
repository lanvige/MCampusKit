//
//  LTNotification.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
// 消息中心 - 消息

#import "MCKUser.h"

@interface MCKNotification : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *senderId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSDate *createtime;
@property (nonatomic, strong) MCKUser *user;
@property (nonatomic, strong) NSString *parameter;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
