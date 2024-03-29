//
//  LTDataWrapper.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCKModelBase.h"
@class MCKError;

@interface MCKDataWrapper : MCKModelBase

@property (nonatomic, strong) MCKError *error;
@property (nonatomic, strong) NSString *timestamp;
@property (nonatomic) BOOL isSuccess;

// model under data node.
@property (nonatomic, strong) NSMutableArray *modelList;


- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
