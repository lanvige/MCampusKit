//
//  MCFriendVt.h
//  MCampusKit
//
//  Created by Lanvige Jiang on 6/28/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCKModelBaseIdentifier.h"

@interface MCKFriendVt : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, assign) BOOL hasClient;
@property (nonatomic, assign) BOOL myColleague;

- (void)unpackDictionary:(NSDictionary *)dictionary;


@end
