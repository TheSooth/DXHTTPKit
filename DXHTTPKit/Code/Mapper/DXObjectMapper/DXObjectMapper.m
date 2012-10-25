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

- (id)initWithClassToGenerate:(Class)aClassToGenerate {
    self = [super init];
    if (self) {
        _classToGenerate = aClassToGenerate;
    }
    return self;
}

- (void)setValuesOnObject:(id)aObject withDictionary:(NSDictionary *)aDictionary {
    NSArray *keys = [aDictionary allKeys];
    for (NSString *key in keys) {
        id value = [aDictionary valueForKey:key];
        NSString *aviableValue = [DXPropertyFinder findPropertyDetailsForKey:key onClass:[aObject class]];
        if (aviableValue){
            [self parseValue:value forObject:aObject forAttribute:key];
        }
    }
}

- (NSArray *)parseArray:(NSArray *)aArray {
    if (!aArray) {
        return nil;
    }
    NSMutableArray *values = [[NSMutableArray alloc] initWithCapacity:[aArray count]];
    for (NSDictionary *dictionary in aArray) {
        id value = [self parseDictionary:dictionary];
        [values addObject:value];
    }
    return [NSArray arrayWithArray:values];
}

- (id) parseDictionary:(NSDictionary *)aDictionary {
    if (!aDictionary) {
        return nil;
    }
    NSArray *keysArray = [aDictionary allKeys];
    id parsedValue = [[_classToGenerate alloc] init];
    for (NSString *key in keysArray) {
        if ([DXPropertyFinder findPropertyDetailsForKey:key onClass:[_classToGenerate class]]) {
            [self parseValue:[aDictionary valueForKey:key] forObject:parsedValue  forAttribute:key];
        }
    }
    return parsedValue;;
}

- (void)parseValue:(id)aValue forObject:(id)aObject forAttribute:(NSString *)aAttributeName {
    
    [DXAttributeSetter assingValue:aValue forAttributeName:aAttributeName andAttributeClass:[aValue class] onObject:aObject];
}

@end
