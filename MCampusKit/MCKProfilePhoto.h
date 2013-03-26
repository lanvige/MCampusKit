//
//  LTProfilePhoto.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKProfilePhoto : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) bool isDefault;
@property (nonatomic, assign) int status;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
