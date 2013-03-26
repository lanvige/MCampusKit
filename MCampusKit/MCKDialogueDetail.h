//
//  LTDialogueDetail.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKDialogueDetail : MCKModelBaseIdentifier

@property (nonatomic, assign) NSInteger senderId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *senderIcon;
@property (nonatomic, strong) NSString *senderName;
@property (nonatomic, assign) NSInteger contacterId;
@property (nonatomic, strong) NSString *resourceUrl;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger readed;
@property (nonatomic, strong) NSDate *createtime;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
