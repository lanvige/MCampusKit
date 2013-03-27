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

#pragma mark -
#pragma mark Build object with Dictionary

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    
    self.name = [dictionary safeObjectForKey:@"name"];
    self.canBeInvited = [dictionary safeObjectForKey:@"canBeInvited"];
    self.hasClient = [[dictionary safeObjectForKey:@"hasClient"] boolValue];

    // If you can't get the user's info, it means it been setted private.
    id infoDic = [dictionary safeObjectForKey:@"info"];

    if (infoDic) {
        self.info = [[MCKProfileInfo alloc] init];
        [self.info unpackDictionary:infoDic];
    }

    // build study detail
    id studyDetailDic = [dictionary safeObjectForKey:@"studyDetail"];

    if (studyDetailDic) {
        self.studyDetail = [[MCKProfileStudyDetail alloc] init];
        [self.studyDetail unpackDictionary:studyDetailDic];
    }

    // build topic reply array(maybe empty.)
    id photosArray = [dictionary safeObjectForKey:@"photos"];
    if (photosArray) {
        // Need init the array first.
        self.photos = [NSMutableArray arrayWithCapacity:[photosArray count]];

        for (NSDictionary *photoAttributes in photosArray) {
            MCKProfilePhoto *photo = [[MCKProfilePhoto alloc] init];
            [photo unpackDictionary:photoAttributes];
            [self.photos addObject:photo];
        }
    }
}

@end