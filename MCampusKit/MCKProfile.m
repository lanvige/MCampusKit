//
//  LTProfile.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKProfile.h"

#import "MCKProfileInfo.h"
#import "MCKProfileStudyDetail.h"
#import "MCKProfilePhoto.h"

@implementation MCKProfile

#pragma mark - Build object with Dictionary

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (!self) {
        return nil;
    }

    self.mId = [attributes valueForKeyPath:@"id"];
    self.name = [attributes valueForKeyPath:@"name"];
    self.canBeInvited = [attributes valueForKey:@"canBeInvited"];
    self.hasClient = [[attributes valueForKey:@"hasClient"] boolValue];
    // build info
    // If you can't get the user's info, it means it been setted private.
    id infoDic = [attributes objectForKey:@"info"];

    if (infoDic != [NSNull null]) {
        self.info = [[MCKProfileInfo alloc] initWithAttributes:infoDic];
    }

    // build study detail
    id studyDetailDic = [attributes objectForKey:@"studyDetail"];

    if (studyDetailDic != [NSNull null]) {
        self.studyDetail = [[MCKProfileStudyDetail alloc] initWithAttributes:studyDetailDic];
    }

    // build topic reply array(maybe empty.)
    id photosArray = [attributes objectForKey:@"photos"];

    if (photosArray != [NSNull null]) {
        // Need init the array first.
        self.photos = [NSMutableArray arrayWithCapacity:[photosArray count]];

        for (NSDictionary *photoAttributes in photosArray) {
            MCKProfilePhoto *photo = [[MCKProfilePhoto alloc] initWithAttributes:photoAttributes];
            [self.photos addObject:photo];
        }
    }

    return self;
}

@end