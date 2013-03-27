//
//  LTError.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKError.h"

@implementation MCKError

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.code = [[dictionary safeObjectForKey:@"code"] intValue];
    self.message = [dictionary safeObjectForKey:@"message"];
}

@end
