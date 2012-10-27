//
//  DXObjectSerializer.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXObjectSerializer.h"

@implementation DXObjectSerializerMapping

+ (BWObjectSerializer *)objectSerializer
{
    static BWObjectSerializer *globalObjectSerializer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        globalObjectSerializer = [BWObjectSerializer new];
    });
    return globalObjectSerializer;
}

- (void)mappingForObject:(Class)objectClass block:(void(^)(DXObjectSerializerMapping *mapping))block
{
    [BWObjectSerializerMapping mappingForObject:objectClass block:(void(^)(BWObjectSerializerMapping *mapping))block];
}

- (void)registerSerializer:(BWObjectSerializerMapping *)aSerializer withRootKeyPath:(NSString *)aKeyPath
{
    [[[self class] objectSerializer] registerSerializer:aSerializer withRootKeyPath:aKeyPath];
}

- (NSDictionary *)serializeObject:(id)aObject
{
    [[self class] setupObject:[self class] withSelector:@selector(setupSerializer)];
    return [[[self class] objectSerializer] serializeObject:aObject];
}

- (NSDictionary *)serializeObject:(id)aObject withMapping:(BWObjectSerializerMapping *)aMapping
{
    [[self class] setupObject:[self class] withSelector:@selector(setupSerializer)];
    return [[[self class] objectSerializer] serializeObject:aObject withMapping:aMapping];
}

+ (void)setup
{
}

@end
