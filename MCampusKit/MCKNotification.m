//
//  LTNotification.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKNotification.h"

@implementation MCKNotification

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd HH:mm"];
        self.Id = [attributes valueForKeyPath:@"id"];
        self.senderId = [attributes valueForKeyPath:@"senderId"];
        self.content = [attributes valueForKeyPath:@"content"];
        self.type = [[attributes valueForKeyPath:@"type"] intValue];
        self.createtime = [formatter dateFromString:[attributes valueForKeyPath:@"createtime"]];
        self.parameter = [attributes valueForKeyPath:@"parameter"];

        // build user
        id userDict = [attributes objectForKey:@"user"];

        if (userDict != [NSNull null]) {
            self.user = [[MCKUser alloc] initWithAttributes:userDict];
        }
    }

    return self;
}

@end