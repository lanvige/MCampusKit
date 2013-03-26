//
//  LTFriend.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFriend.h"

@implementation MCKFriend

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.mId = [attributes valueForKeyPath:@"id"];
    self.name = [attributes valueForKeyPath:@"name"];
    self.icon = [attributes valueForKeyPath:@"icon"];
    self.status = [[attributes valueForKeyPath:@"status"] intValue];
    self.groupId = [[attributes valueForKeyPath:@"groupId"] intValue];
    self.phoneNumber = [attributes valueForKeyPath:@"phoneNumber"];
    self.hasClient = [[attributes valueForKey:@"hasClient"] boolValue];
    self.myClassmate = [[attributes valueForKey:@"myClassmate"] boolValue];
    
    return self;
}

@end
