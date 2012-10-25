//
//  DXObjectMapper.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXObjectMapper.h"

@interface DXObjectMapper()

@property (nonatomic, strong) DXPropertyFinder *propertyFinder;
@end

@implementation DXObjectMapper

- (void)setValuesOnObject:(id)aObject withDictionary:(NSDictionary *)aDictionary{
    NSArray *keys = [aDictionary allKeys];
    for (NSString *key in keys) {
        id value = [aDictionary valueForKey:key];
        NSString *aviableValue = [DXPropertyFinder findPropertyDetailsForKey:key onClass:[aObject class]];
        if (aviableValue){
            [self parseValue:value forObject:aObject forAttribute:key];
        }
    }
}

- (void) parseValue:(id)aValue forObject:(id)aObject forAttribute:(NSString *)aAttributeName {
    
    [DXAttributeSetter assingValue:aValue forAttributeName:aAttributeName andAttributeClass:[NSString class] onObject:aObject];
}

@end
