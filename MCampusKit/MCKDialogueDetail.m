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

- (id)initWithAttributes:(NSDictionary *)attributes
{
    // build frame
    self = [super init];

    if (!self) {
        return nil;
    }

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd HH:mm"];

    self.mId = [attributes valueForKeyPath:@"id"];
    self.senderId = [[attributes valueForKeyPath:@"senderId"] intValue];
    self.content = [attributes valueForKeyPath:@"content"];
    self.senderIcon = [attributes valueForKeyPath:@"senderIcon"];
    self.senderName = [attributes valueForKeyPath:@"senderName"];
    self.contacterId = [[attributes valueForKeyPath:@"contacterId"] intValue];
    self.resourceUrl = [attributes valueForKeyPath:@"resourceUrl"];
    self.status = [[attributes valueForKeyPath:@"status"] intValue];
    self.readed = [[attributes valueForKeyPath:@"readed"] intValue];
    self.createtime = [formatter dateFromString:[attributes valueForKeyPath:@"createtime"]];

    return self;
}

@end