//
//  UserContext.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"


@interface MCKUserContext : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatar;

//@property (nonatomic, strong) NSString *PhoneNumber;
//@property (nonatomic) NSInteger Gender;
//@property (nonatomic, strong) NSString *Intro;
//@property (nonatomic) BOOL CanBeInvite;
//@property (nonatomic) NSInteger GroupId;
//@property (nonatomic, strong) NSString *GroupName;
//@property (nonatomic) NSInteger FriendCount;
//@property (nonatomic) NSInteger CourseCount;
//@property (nonatomic) NSInteger DiscussionCount;
//@property (nonatomic) NSInteger ProvinceId;
//@property (nonatomic) NSInteger ProvinceName;
//@property (nonatomic) NSInteger CityId;
//@property (nonatomic) NSInteger CityName;
//@property (nonatomic) NSInteger CityCode;
//@property (nonatomic, strong) NSData *BirthData;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
