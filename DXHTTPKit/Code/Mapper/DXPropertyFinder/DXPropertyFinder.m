//
//  DXPropertyFinder.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXPropertyFinder.h"

@implementation DXPropertyFinder

+ (NSString *) findPropertyDetailsForKey: (NSString *)key onClass: (Class)class {
    objc_property_t property = class_getProperty(class , [key UTF8String]);
    if (property) {
        NSString *attributeDetails = [NSString stringWithUTF8String:property_getAttributes(property)];
        return attributeDetails;
    }
    return nil;
}

@end
