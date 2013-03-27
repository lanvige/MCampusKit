//
//  LTMessage.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKMms.h"
#import "MCKFrameInfo.h"

@implementation MCKMms

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.mId = [dictionary safeObjectForKey:@"messageId"];
    self.title = [dictionary safeObjectForKey:@"title"];
    self.mmsId = [[dictionary safeObjectForKey:@"mmsId"] intValue];
    self.status = [[dictionary safeObjectForKey:@"status"] intValue];

    id frameInfoArray = [dictionary safeObjectForKey:@"frameInfoList"];

    if (frameInfoArray) {
        self.frameInfoList = [NSMutableArray arrayWithCapacity:[frameInfoArray count]];

        for (NSDictionary *fiAttributes in frameInfoArray) {
            MCKFrameInfo *frameInfo = [[MCKFrameInfo alloc] init];
            [frameInfo unpackDictionary:fiAttributes];
            [self.frameInfoList addObject:frameInfo];
        }
    }
}

@end