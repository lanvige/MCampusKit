//
//  LTDialogueDetail.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/14/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKDialogueDetail.h"

@implementation MCKDialogueDetail

#pragma mark - Build object with Dictionary

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];

    self.mId = [dictionary safeObjectForKey:@"id"];
    self.senderId = [[dictionary safeObjectForKey:@"senderId"] intValue];
    self.content = [dictionary safeObjectForKey:@"content"];
    self.senderIcon = [dictionary safeObjectForKey:@"senderIcon"];
    self.senderName = [dictionary safeObjectForKey:@"senderName"];
    self.contacterId = [[dictionary safeObjectForKey:@"contacterId"] intValue];
    self.resourceUrl = [dictionary safeObjectForKey:@"resourceUrl"];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];
    self.readed = [[dictionary safeObjectForKey:@"readed"] intValue];
    self.createtime = [formatter dateFromString:[dictionary safeObjectForKey:@"createtime"]];
}

@end