//
//  LTFrameInfoList.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFrameInfo.h"

@implementation MCKFrameInfo

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    self.resourceUrl = [dictionary safeObjectForKey:@"resourceUrl"];
    self.audioUrl = [dictionary safeObjectForKey:@"audioUrl"];
    self.thumbImgUrl = [dictionary safeObjectForKey:@"thumbimgUrl"];
    self.videoImgUrl = [dictionary safeObjectForKey:@"videoImgUrl"];
    self.resourceType = [dictionary safeObjectForKey:@"resourceType"];
    self.context = [dictionary safeObjectForKey:@"status"];
    self.size = [[dictionary safeObjectForKey:@"size"] longValue];
}

@end
