//
//  DXAttributeSetter.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXAttributeSetter : NSObject

+ (void)assingValue:(id)value forAttributeName:(NSString *)aAttributeName andAttributeClass:(Class)aAttributeClass onObject:(id)aObject;
@end
