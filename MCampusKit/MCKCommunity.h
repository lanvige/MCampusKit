//
//  LTTopic.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//
// 消息中心 - 讨论

#import "MCKModelBaseIdentifier.h"

@interface MCKCommunity : MCKModelBaseIdentifier

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userIcon;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *resourceUrl;
@property (nonatomic, strong) NSString *courseId;
@property (nonatomic, strong) NSString *courseName;
@property (nonatomic, strong) NSString *coursewareId;
@property (nonatomic, strong) NSString *coursewareName;
@property (nonatomic, strong) NSString *createtime;
@property (nonatomic, assign) NSInteger replayCount;
@property (nonatomic, strong) NSMutableArray *replies;
@property (nonatomic, strong) NSString *updateTimestamp;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
