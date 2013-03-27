//
//  LTProgressSet.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKProgressSet : MCKModelBase

@property (nonatomic, assign) NSInteger recordCount;
@property (nonatomic, strong) NSMutableArray *progresses;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
