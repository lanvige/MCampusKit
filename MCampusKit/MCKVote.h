//
//  LTVote.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKVote : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *noticeId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *votedOption;
@property (nonatomic, strong) NSMutableArray *options;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
