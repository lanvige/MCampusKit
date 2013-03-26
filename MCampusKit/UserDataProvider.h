//
//  UserDataProvider.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseDataProvider.h"

@class MCKDataWrapper;

@interface UserDataProvider : BaseDataProvider
{
}
- (void)sendCodeWithPhone:(NSString *)phone
                     type:(NSString *)type
                  success:(void (^)(MCKDataWrapper *dataWrapper))success
                  failure:(void (^)(NSError *error))failure;

- (void)sendCodeForgotWithPhone:(NSString *)phone
                           type:(NSString *)type
                        success:(void (^)(MCKDataWrapper *dataWrapper))success
                        failure:(void (^)(NSError *error))failure;

- (void)setPasswordWithPhone:(NSString *)phone
                    password:(NSString *)password
                  activeCode:(NSString *)activeCode
                     success:(void (^)(MCKDataWrapper *dataWrapper))success
                     failure:(void (^)(NSError *error))failure;

- (void)setPasswordForgotWithPhone:(NSString *)phone
                          password:(NSString *)password
                        activeCode:(NSString *)activeCode
                           success:(void (^)(MCKDataWrapper *dataWrapper))success
                           failure:(void (^)(NSError *error))failure;

- (void)resetPasswordWithPhone:(NSString *)phone
                      password:(NSString *)password
                    activeCode:(NSString *)activeCode
                       success:(void (^)(MCKDataWrapper *dataWrapper))success
                       failure:(void (^)(NSError *error))failure;

- (void)loginWithPhone:(NSString *)nameOrPhone
              password:(NSString *)password
               success:(void(^)(MCKDataWrapper *dataWrapper))success
               failure:(void (^)(NSError *error))failure;

- (void)getUserProfileWithUserId:(NSString *)userId
                         success:(void (^)(MCKDataWrapper *dataWrapper))success
                         failure:(void (^)(NSError *error))failure;

- (void)getMyProfileWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
                        failure:(void (^)(NSError *error))failure;

- (void)updateMyProfileWithGender:(NSString *)gender
                        birthdate:(NSString *)birthdate
                         cityCode:(NSString *)cityCode
                         qqNumber:(NSString *)qqNumber
                            hobby:(NSString *)hobby
                   defaultPhotoId:(NSString *)defaultPhotoId
                         photoIds:(NSString *)photoIds
                          success:(void (^)(MCKDataWrapper *dataWrapper))success
                          failure:(void (^)(NSError *error))failure;

- (void)updateAvatarWithImageData:(NSData *)imageData
                         progress:(void (^)(CGFloat progress))progressBlock
                          success:(void (^)(MCKDataWrapper *dataWrapper))success
                          failure:(void (^)(NSError *error))failure;

- (void)getUserSettingsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
                           failure:(void (^)(NSError *error))failure;

- (void)updateUserSettingsWithCanbeinvited:(NSString *)canbeinvited
                               showProfile:(NSString *)showProfile
                                   success:(void (^)(MCKDataWrapper *dataWrapper))success
                                   failure:(void (^)(NSError *error))failure;

@end
