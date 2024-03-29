//
//  User.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUser.h"
#import "SSKeychain.h"
#import "MCKDefines.h"

NSString *const kMCKCurrentUserChangedNotification = @"MCKCurrentUserChangedNotification";
static NSString *const kMCKUserIdKey = @"MCKUserId";
static MCKUser *__currentUser = nil;

@implementation MCKUser

+ (MCKUser *)currentUser
{
    if (!__currentUser) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        NSData *userData = [userDefaults objectForKey:kMCKUserIdKey];
        MCKUser *user = [NSKeyedUnarchiver unarchiveObjectWithData:userData];

        if (!user) {
            return nil;
        }

        NSString *accessToken = [SSKeychain passwordForService:kMCKKeychainServiceName account:user.mId];

        if (!accessToken) {
            NSLog(@"Failed to get access token");
            return nil;
        }

        __currentUser = user;
    }

    return __currentUser;
}

+ (void)setCurrentUser:(MCKUser *)user
{
    if (__currentUser) {
        [SSKeychain deletePasswordForService:kMCKKeychainServiceName account:__currentUser.mId];
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (!user.mId || !user.accessToken) {
        __currentUser = nil;
        [userDefaults removeObjectForKey:kMCKUserIdKey];
    } else {
        [SSKeychain setPassword:user.accessToken forService:kMCKKeychainServiceName account:user.mId];
        
        __currentUser = user;
        NSData *userData = [NSKeyedArchiver archivedDataWithRootObject:user];
        [userDefaults setObject:userData forKey:kMCKUserIdKey];
    }

    [userDefaults synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:kMCKCurrentUserChangedNotification object:user];
}

+ (void)updateToken:(NSString *)token
{
    MCKUser *user = [[self class] currentUser];
    user.accessToken = token;
    [[self class] setCurrentUser:user];
}

+ (void)updateAvatar:(NSString *)avatar
{
    MCKUser *user = [[self class] currentUser];
    user.avatar = avatar;
    [[self class] setCurrentUser:user];
}

#pragma mark -
#pragma mark Build object with Dictionary

- (BOOL)shouldUnpackDictionary:(NSDictionary *)dictionary
{
    return TRUE;
}

- (void)unpackDictionary:(NSDictionary *)dictionary
{
    [super unpackDictionary:dictionary];
    self.username = [dictionary safeObjectForKey:@"name"];
    self.avatar = [dictionary safeObjectForKey:@"icon"];
    self.accessToken = [dictionary safeObjectForKey:@"token"];
}

@end
