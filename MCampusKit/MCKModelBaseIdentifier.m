//
//  ModelBase.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@implementation MCKModelBaseIdentifier

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [[dictionary safeObjectForKey:@"id"] stringValue];
}

@end