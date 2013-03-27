//
//  LTProfile.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@class MCKProfileInfo, MCKProfileStudyDetail, MCKProfilePhoto;

@interface MCKProfile : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) bool canBeInvited;
@property (nonatomic, assign) bool hasClient;
@property (nonatomic, strong) MCKProfileInfo *info;
@property (nonatomic, strong) MCKProfileStudyDetail *studyDetail;
@property (nonatomic, strong) NSMutableArray *photos;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
