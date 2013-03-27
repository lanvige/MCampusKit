//
//  LTProfileInfo.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/13/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKProfileInfo : MCKModelBaseIdentifier

@property (nonatomic, assign) NSInteger gender;
@property (nonatomic, strong) NSString *cityCode;
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSDate *birthdate;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *qqNumber;
@property (nonatomic, strong) NSString *hobby;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
