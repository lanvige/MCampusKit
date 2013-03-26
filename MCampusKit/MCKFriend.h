//
//  LTFriend.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"

@interface MCKFriend : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger groupId;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, assign) bool hasClient;
@property (nonatomic, assign) bool myClassmate;
@property (nonatomic, strong) NSString *strName;
- (id)initWithAttributes:(NSDictionary *)attributes;

@end
