//
//  LTError.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKError : MCKModelBase

@property (nonatomic, assign) NSInteger code;
@property (nonatomic, strong) NSString *message;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
