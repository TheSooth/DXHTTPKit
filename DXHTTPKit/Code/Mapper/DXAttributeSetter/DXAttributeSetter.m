//
//  DXAttributeSetter.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXAttributeSetter.h"

@implementation DXAttributeSetter

+ (void)assingValue:(id)value forAttributeName:(NSString *)aAttributeName andAttributeClass:(Class)aAttributeClass onObject:(id)aObject {
    if([aObject validateValue:&value forKey:aAttributeName error:nil]){
        if([value isKindOfClass:[NSNull class]]){
            value = nil;
        }
        if(([value isKindOfClass:[NSNull class]] || value == nil) && aAttributeClass == [NSString class]){
            [aObject setValue:nil forKey:aAttributeName];
        }else {
            [aObject setValue:value forKey:aAttributeName];
        }
    }
}
@end
