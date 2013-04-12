//
//  LTTopicReply.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKCommunityReply : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userIcon;
@property (nonatomic, strong) NSString *userType;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *createtime;

@property (nonatomic, strong) NSString *strInsertName;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
