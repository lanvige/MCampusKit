//
//  LTFrameInfoList.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKFrameInfo.h"

@implementation MCKFrameInfo

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        self.resourceUrl = [attributes valueForKeyPath:@"resourceUrl"];
        self.audioUrl = [attributes valueForKeyPath:@"audioUrl"];
        self.thumbImgUrl = [attributes valueForKeyPath:@"thumbimgUrl"];
        self.videoImgUrl = [attributes valueForKeyPath:@"videoImgUrl"];
        self.resourceType = [attributes valueForKeyPath:@"resourceType"];
        self.context = [attributes valueForKeyPath:@"status"];
        self.size = [[attributes valueForKeyPath:@"size"] longValue];
    }

    return self;
}

@end
