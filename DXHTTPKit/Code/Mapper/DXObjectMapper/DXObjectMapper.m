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

- (void) setValuesOnObject: (id) object withDictionary: (NSDictionary *) dictionary {
    NSArray *keys = [dictionary allKeys];
    for (NSString *key in keys) {
        id value = [dictionary valueForKey:key];
        NSString *aviableValue = [DXPropertyFinder findPropertyDetailsForKey:key onClass:[object class]];
        if (aviableValue){
            [self parseValue:value forObject:object forAttribute:key];
        }
    }
}

- (void) parseValue: (id) value forObject: (id) object forAttribute:(NSString *)attributeName {
    
    [DXAttributeSetter assingValue:value forAttributeName:attributeName andAttributeClass:[NSString class] onObject:object];
}

@end
