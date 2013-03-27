//
//  UserContext.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"


@interface MCKUserContext : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatar;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
