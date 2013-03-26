//
//  LTMessage.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/11/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

// MMS
#import <Foundation/Foundation.h>

#import "MCKModelBaseIdentifier.h"

@interface MCKMms : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger mmsId;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSMutableArray *frameInfoList;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
