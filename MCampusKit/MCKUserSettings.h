//
//  LTUserSettings.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKUserSettings : MCKModelBase

@property (nonatomic, assign) BOOL canBeInvited;
@property (nonatomic, assign) BOOL showProfile;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
