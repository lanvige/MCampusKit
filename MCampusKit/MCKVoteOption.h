//
//  LTVoteOption.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKVoteOption : MCKModelBase

@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *value;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
