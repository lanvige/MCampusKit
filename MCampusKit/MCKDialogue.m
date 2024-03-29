//
//  LTDialogue.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDialogue.h"

@implementation MCKDialogue

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.userId = [[dictionary safeObjectForKey:@"userId"] stringValue];
    self.userIcon = [dictionary safeObjectForKey:@"userIcon"];
    self.userName = [dictionary safeObjectForKey:@"userName"];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.messageCount = [[dictionary safeObjectForKey:@"messageCount"] intValue];
    self.unreadedMsgCount = [[dictionary safeObjectForKey:@"unreadedMsgCount"] intValue];
    self.updatetime = [dictionary safeObjectForKey:@"updatetime"];
    self.hasNewMessage = [[dictionary safeObjectForKey:@"hasNewMessage"] boolValue];
    self.updateTimestamp = [dictionary safeObjectForKey:@"updateTimestamp"];
}

@end
