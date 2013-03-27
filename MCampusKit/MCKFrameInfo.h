//
//  LTFrameInfoList.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBase.h"

@interface MCKFrameInfo : MCKModelBase

@property (nonatomic, strong) NSString *resourceUrl;
@property (nonatomic, strong) NSString *audioUrl;
@property (nonatomic, strong) NSString *thumbImgUrl;
@property (nonatomic, strong) NSString *videoImgUrl;
@property (nonatomic, strong) NSString *resourceType;
@property (nonatomic, strong) NSString *context;
@property (nonatomic, assign) long size;

- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
