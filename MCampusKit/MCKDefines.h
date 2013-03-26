//
//  MCKDefines.h
//  MCampusKit
//
//  Created by Lanvige Jiang on 3/26/13.
//  Copyright (c) 2013 Lanvige Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

// MCKDispatchRelease
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 60000 || MAC_OS_X_VERSION_MIN_REQUIRED >= 1080
#define MCKDispatchRelease(queue)
#else
#define MCKDispatchRelease(queue) dispatch_release(queue)
#endif

extern NSString *const kAPIBaseURLString;
