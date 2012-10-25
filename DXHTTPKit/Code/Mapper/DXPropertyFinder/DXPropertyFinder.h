//
//  DXPropertyFinder.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <objc/runtime.h>

@interface DXPropertyFinder : NSObject

+ (NSString *)findPropertyDetailsForKey:(NSString *)aKey onClass:(Class)aClass;
@end
