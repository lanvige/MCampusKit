//
//  LTDataWrapper.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDataWrapper.h"
#import "MCKError.h"
#import "NSDictionary+MCampusKit.h"

@implementation MCKDataWrapper

#pragma mark - 
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.timestamp = [dictionary safeObjectForKey:@"timestamp"];
    self.isSuccess = [[dictionary safeObjectForKey:@"isSuccess"] boolValue];
    self.error = [dictionary safeObjectForKey:@"error"];
    
    // Build error object.
    id errorDic = [dictionary safeObjectForKey:@"error"];
    
    if (errorDic) {
        self.error = [[MCKError alloc] init];
        [self.error unpackDictionary:errorDic];
    }
}

@end
