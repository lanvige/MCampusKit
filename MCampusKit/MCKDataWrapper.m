//
//  LTDataWrapper.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDataWrapper.h"

@implementation MCKDataWrapper

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        bool result = false;

        self.timestamp = [attributes valueForKeyPath:@"timestamp"];
        self.isSuccess = [[attributes valueForKeyPath:@"isSuccess"] boolValue];

        // Build error object.
        id errorDic = [attributes objectForKey:@"error"];

        if (errorDic != [NSNull null]) {
            self.error = [[MCKError alloc] initWithAttributes:errorDic];
            result = true;
        }
    }

    return self;
}

@end
