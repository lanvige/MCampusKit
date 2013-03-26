//
//  LTTopicReply.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKCommunityReply.h"

@implementation MCKCommunityReply

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes {
    // build frame
    self = [super init];
    if (!self) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];
    
    self.mId = [attributes valueForKeyPath:@"id"];
    self.userId = [[attributes valueForKeyPath:@"userId"] intValue];
    self.userIcon = [attributes valueForKeyPath:@"userIcon"];
    self.userName = [attributes valueForKeyPath:@"userName"];
    self.userType = [attributes valueForKeyPath:@"userType"];
    self.content = [attributes valueForKeyPath:@"content"];
    self.createtime = [formatter dateFromString:[attributes valueForKeyPath:@"createtime"]];
    
    return self;
}

@end
