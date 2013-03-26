//
//  CityData.h
//  MobileCampus
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityData : NSObject

@property (nonatomic) int rowID;
@property (nonatomic) int province_id;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *city_num;

@end
