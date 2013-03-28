//
//  UserProvider.m
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/8/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKUserDataProvider.h"
#import "MCKHTTPClient.h"
#import "MCKUser.h"
#import "MCKDataWrapper.h"
#import "MCKUserSettings.h"
#import "MCKProfile.h"

@implementation MCKUserDataProvider

#pragma mark -
#pragma mark Register, Login

// http://222.66.33.210:9092/rest/v1/user/activate/sendcode?phone=13681667933&type=1
// Error null, Data 0, 1?
- (void)sendCodeWithPhone:(NSString *)phone
    type:(NSString *)type
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/activate/sendcode?phone=%@&type=1", phone];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// Forgot password
// http://222.66.33.210:9092/rest/v1/user/activate/sendcode?phone=13681667933&type=2
- (void)sendCodeForgotWithPhone:(NSString *)phone
    type:(NSString *)type
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/activate/sendcode?phone=%@&type=2", phone];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {

         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/user/activiate?nameorphone=13681667933&acode=098762&password=123456&ctype=1
- (void)setPasswordWithPhone:(NSString *)phone
    password:(NSString *)password
    activeCode:(NSString *)activeCode
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/activate?phone=%@&acode=%@&password=%@&ctype=1", phone, activeCode, password];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             [dataWrapper.modelList addObject:jsonData];

             // FIXME: CACHE
//                                   CACHE.context = [[MCUserContext alloc] initWithAttributes:jsonData];
//                                   [CACHE store];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/user/activiate?nameorphone=13681667933&acode=098762&password=123456&ctype=2
- (void)setPasswordForgotWithPhone:(NSString *)phone
    password:(NSString *)password
    activeCode:(NSString *)activeCode
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/activate?phone=%@&acode=%@&password=%@&ctype=2", phone, activeCode, password];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             [dataWrapper.modelList addObject:jsonData];

             // FIXME:
//                                   CACHE.context = [[MCUserContext alloc] initWithAttributes:jsonData];
//                                   [CACHE store];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         //                              [CACHE restore];
         //                              DLog(@"USERCONTEXT mId=== %@  userName=%@",CACHE.context.mId,CACHE.context.name);

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/user/activate?nameorphone=13681667933&acode=098762&password=123456
- (void)resetPasswordWithPhone:(NSString *)phone
    password:(NSString *)password
    activeCode:(NSString *)activeCode
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/resetpwd?nameorphone=%@&acode=%@&password=%@&ctype=2", phone, activeCode, password];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:jsonData];

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// http://222.66.33.210:9092/rest/v1/user/login?nameorphone=13681667933&pwd=e10adc3949ba59abbe56e057f20f883e&t=
- (void)loginWithPhone:(NSString *)nameOrPhone
    password:(NSString *)password
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/login?nameorphone=%@&pwd=%@&client=2", nameOrPhone, password];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             MCKUser *user = [MCKUser objectWithDictionary:jsonData];
             [MCKUser setCurrentUser:user];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}


#pragma mark -
#pragma mark User & friend profile

// http://222.66.33.210:9092/rest/v1/user/info/get?uid=39&fuid=39&t=F0B09E1537ACCA3A
// muid is the current user id, can get in user context.
// uid is the user's info you want to get.
- (void)getUserProfileWithUserId:(NSString *)userId
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/info/get?fuid=%@", userId];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKProfile *profile = [[MCKProfile alloc] init];
             [profile unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:profile];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

- (void)getMyProfileWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    // FIXME:
//    [self getUserProfileWithUserId:CACHE.context.mId
//                           success:^(MCKDataWrapper *dataWrapper) {
//         if (success) {
//             success(dataWrapper);
//         }
//     } failure:^(NSError *error) {
//         if (failure) {
//             failure(error);
//         }
//     }];
}

// http://222.66.33.210:9092/rest/v1/ios/info/update?gender=&birthdate=&cityCode=&qqNumber=&hobby=defaultPhotoId&photoIds=
- (void)updateMyProfileWithGender:(NSString *)gender
    birthdate:(NSString *)birthdate
    cityCode:(NSString *)cityCode
    qqNumber:(NSString *)qqNumber
    hobby:(NSString *)hobby
    defaultPhotoId:(NSString *)defaultPhotoId
    photoIds:(NSString *)photoIds
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{

    NSString *path = @"v1/user/ios/info/update";

    NSDictionary *params = @{
        @"gender": gender,
        @"birthdate": birthdate,
        @"city": cityCode,
        @"qq": qqNumber,
        @"hobby": hobby,
        @"dpid": defaultPhotoId,
        @"pids": photoIds,
// FIXME:
//        @"uid" : CACHE.context.mId,
//        @"t" : CACHE.context.token,
    };

    [self saveObjectWithMultiHeaderAndPath:path
                                parameters:params
                                completion:^(id jsonData) {
         MCKDataWrapper *dataWrapper = [[MCKDataWrapper alloc] init];
                                    [dataWrapper unpackDictionary:jsonData];

         [dataWrapper.modelList addObject:nil];

         if (success) {
             success(dataWrapper);
         }
     }];
}

// POST - user/icon/save
// @POST
// @Path( "/icon/save" )
// @Consumes (MediaType. MULTIPART_FORM_DATA)
// @Produces (MediaType. APPLICATION_JSON + ";charset=UTF-8")
//
// @FormDataParam ("file" ) InputStream uploadedInputStream,
// @FormDataParam ("file" ) FormDataContentDisposition fileDetail,
// @FormDataParam ("uid" ) int userId, @FormDataParam( "t" ) String token);
- (void)updateAvatarWithImageData:(NSData *)imageData
    progress:(void (^)(CGFloat progress))progressBlock
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = @"v1/user/icon/save";

    NSDictionary *params = @{
// FIXME:
//        @"uid" : CACHE.context.mId,
//        @"t" : CACHE.context.token,
    };

    [self saveObjectWithPath:path
                  parameters:params
                   imageData:imageData
                    progress:^(CGFloat progress) {
         if (progressBlock) {
             progressBlock(progress);
         }
     } completion:^(BOOL success2, NSError *error, id jsonData) {
         MCKDataWrapper *dataWrapper = [[MCKDataWrapper alloc] init];
         [dataWrapper unpackDictionary:jsonData];
         NSString *str = [jsonData objectForKey:@"data"];
         dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
         [dataWrapper.modelList addObject:str];

         if (success) {
             success(dataWrapper);
         }
     }];
}

#pragma mark -
#pragma mark User settings

// http://222.66.33.210:9092/rest/v1/user/setting/get?uid=39&t=F0B09E1537ACCA3A
- (void)getUserSettingsWithSuccess:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/setting/get?"];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (jsonData) {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:1];
             MCKUserSettings *settings = [[MCKUserSettings alloc] init];
             [settings unpackDictionary:jsonData];
             [dataWrapper.modelList addObject:settings];
         } else {
             dataWrapper.modelList = [NSMutableArray arrayWithCapacity:0];
         }

         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

// There is a problem, with the response, the data is a string, not a object.????
// Need change the data wrapper data structure.
// http://222.66.33.210:9092/rest/v1/user/setting/save?uid=39&canbeinvited=0&showprofile=0&t=F0B09E1537ACCA3A
- (void)updateUserSettingsWithCanbeinvited:(NSString *)canbeinvited
    showProfile:(NSString *)showProfile
    success:(void (^)(MCKDataWrapper *dataWrapper))success
    failure:(void (^)(NSError *error))failure
{
    NSString *path = [NSString stringWithFormat:@"v1/user/setting/save?canbeinvited=%@&showprofile=%@", canbeinvited, showProfile];

    [self getObjectsWithTokenPath:path
                        paramters:nil
                          success:^(AFHTTPRequestOperation *operation, MCKDataWrapper *dataWrapper, id jsonData) {
         if (success) {
             success(dataWrapper);
         }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         if (failure) {
             failure(error);
         }
     }];
}

@end