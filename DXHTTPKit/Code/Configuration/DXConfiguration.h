//
//  DXObjectSetup.h
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXConfiguration : NSObject

+ (void)setupObject:(Class)aObject withSelector:(SEL)aSetupSelector;

@end
