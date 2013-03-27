//
//  ModelBase.h
//  MobileCampus
//
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKModelBaseIdentifier : MCKModelBase

@property (nonatomic, strong) NSString *mId;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end