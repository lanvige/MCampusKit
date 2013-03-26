//
//  LTError.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKError.h"

@implementation MCKError

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.code = [[attributes valueForKeyPath:@"code"] intValue];
        self.message = [attributes valueForKeyPath:@"message"];
    }

    return self;
}

@end
