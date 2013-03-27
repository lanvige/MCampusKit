//
//  LTProgress.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 10/16/12.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import "MCKModelBaseIdentifier.h"

@interface MCKProgress : MCKModelBaseIdentifier

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;
@property (nonatomic, assign) float progress;
@property (nonatomic, assign) bool isMyClassMate;


- (void)unpackDictionary:(NSDictionary *)dictionary;

@end
