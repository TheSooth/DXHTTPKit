//
//  DXObjectMapping.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/26/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXObjectMapping.h"
#import <MAObjCRuntime/MARTNSObject.h>
#import "DXConfiguration.h"

@implementation DXObjectMapping

+ (BWObjectMapper*)objectMapper
{
    static BWObjectMapper *globalObjectMapper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        globalObjectMapper = [BWObjectMapper new];
    });
    return globalObjectMapper;
}

+ (void)mappingForObject:(Class)objectClass block:(void(^)(BWObjectMapping *mapping))block
{
    [BWObjectMapping mappingForObject:objectClass block:block];
}

+ (void)registerMapping:(BWObjectMapping *)aMapping
{
    [[[self class] objectMapper] registerMapping:aMapping];
}

+(void)registerMapping:(BWObjectMapping*)aMapping withRootKeyPath:(NSString *)aRootKeyPath
{
    [[[self class] objectMapper] registerMapping:aMapping withRootKeyPath:aRootKeyPath];
}

+ (void)objectWithBlock:(BWObjectMappingObjectBlock)objectBlock
{
    [[[self class] objectMapper] objectWithBlock:objectBlock];
}

+ (NSArray *)objectsFromJSON:(id)JSON forMappedClass:(Class)aMappedClass
{
    return [[[self class] objectMapper] objectsFromJSON:JSON forMappedClass:aMappedClass];
}

+ (id)objectFromJSON:(id)JSON withObjectClass:(Class)objectClass {
    return [[[self class] objectMapper] objectFromJSON:JSON withObjectClass:objectClass];
}

+ (void)setup
{
    
}

@end