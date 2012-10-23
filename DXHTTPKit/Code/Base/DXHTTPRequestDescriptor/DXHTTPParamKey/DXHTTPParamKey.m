//
//  DXHTTPParamKey.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/14/12.
//  Copyright (c) 2012 TheSooth. All rights reserved.
//

#import "DXHTTPParamKey.h"
#import "DXHTTPFormFileDescriptor.h"

@implementation DXHTTPParamKey


+ (BOOL)checkAllowedClasses:(Class)aValueFieldClass isParamValueField:(BOOL)isParamValueField  {
    NSArray *allowedClasses;
    if (isParamValueField) {
        allowedClasses = [self allowedClassesForParamValueField];
    } else {
        allowedClasses = [self allowedClassesForHeaderValueField];
    }
    
    for(int i = 0; i < [allowedClasses count]; ++i) {
        if([[aValueFieldClass class] isSubclassOfClass:[allowedClasses[i] class]]) {
            return YES;
        }
    }
    return NO;
}

+ (NSArray *)allowedClassesForHeaderValueField {
    static NSArray *allowedClasses = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowedClasses = @[[NSString class], [NSArray class]];
    });
    return allowedClasses;
}

+ (NSArray *)allowedClassesForParamValueField {
    static NSArray *allowedClasses = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        allowedClasses = @[[NSString class], [DXHTTPFormFileDescriptor class]];
    });
    return allowedClasses;
}

+ (BOOL)isAllowedClassForParamValueField:(Class)valueFieldClass {
    return [self checkAllowedClasses:valueFieldClass isParamValueField:YES];
}


+ (BOOL)isAllowedClassForHeaderValueField:(Class)valueFieldClass {
    return [self checkAllowedClasses:valueFieldClass isParamValueField:NO];
}
@end
