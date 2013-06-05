//
//  User.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

extern NSString *const kMCKCurrentUserChangedNotification;

@interface MCKUser : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *accessToken;

+ (MCKUser *)currentUser;
+ (void)setCurrentUser:(MCKUser *)user;
+ (void)updateToken:(NSString *)token;
+ (void)updateAvatar:(NSString *)avatar;

@end
