//
//  LTDialogue.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDialogue.h"

@implementation MCKDialogue

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    // build frame
    self = [super init];

    if (!self) {
        return nil;
    }

    self.mId = [attributes valueForKeyPath:@"id"];
    self.userId = [attributes valueForKeyPath:@"userId"];
    self.userIcon = [attributes valueForKeyPath:@"userIcon"];
    self.userName = [attributes valueForKeyPath:@"userName"];
    self.content = [attributes valueForKeyPath:@"content"];
    self.messageCount = [[attributes valueForKeyPath:@"messageCount"] intValue];
    self.unreadedMsgCount = [[attributes valueForKeyPath:@"unreadedMsgCount"] intValue];
    self.updatetime = [attributes valueForKeyPath:@"updatetime"];
    self.hasNewMessage = [[attributes valueForKeyPath:@"hasNewMessage"] boolValue];
    self.updateTimestamp = [attributes valueForKeyPath:@"updateTimestamp"];

    return self;
}

@end
