//
//  User.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUser.h"

@implementation MCKUser

@synthesize username, avatar;

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.mId = [attributes valueForKeyPath:@"userId"];
    self.username = [attributes valueForKeyPath:@"userName"];
    self.avatar = [attributes valueForKeyPath:@"icon"];
    
    return self;
}

@end
