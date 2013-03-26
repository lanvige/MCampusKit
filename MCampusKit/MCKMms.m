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

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    // build frame
    self = [super init];

    if (!self) {
        return nil;
    }

    // messageid 是主键
    // TODO
    self.mId = [attributes valueForKeyPath:@"messageId"];
    self.title = [attributes valueForKeyPath:@"title"];
    self.mmsId = [[attributes valueForKeyPath:@"mmsId"] intValue];
    self.status = [[attributes valueForKeyPath:@"status"] intValue];

    // build array(maybe empty.)
    id frameInfoArray = [attributes objectForKey:@"frameInfoList"];

    if (frameInfoArray != [NSNull null]) {
        // Need init the array first.
        self.frameInfoList = [NSMutableArray arrayWithCapacity:[frameInfoArray count]];

        for (NSDictionary *fiAttributes in frameInfoArray) {
            MCKFrameInfo *frameInfo = [[MCKFrameInfo alloc] initWithAttributes:fiAttributes];
            [self.frameInfoList addObject:frameInfo];
        }
    }

    return self;
}

@end