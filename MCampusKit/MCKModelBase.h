//
//  LTModelSuperBase.h
//  MobileCampus
//
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDictionary+MCampusKit.h"

@interface MCKModelBase : NSObject

+ (id)objectWithDictionary:(NSDictionary *)dictionary;
- (BOOL)shouldUnpackDictionary:(NSDictionary *)dictionary;
- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
