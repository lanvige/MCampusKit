//
//  User.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"

@interface MCKUser : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
