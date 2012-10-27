//
//  DXObjectMapping.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/26/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXObjectMapping.h"
#import <MAObjCRuntime/MARTNSObject.h>

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

+ (void)loadMappings
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *subclasses = [self rt_subclasses];
        for (Class cls in subclasses) {
            [[cls new] setupMapping];
        }
    });
}

- (void)mappingForObject:(Class)objectClass block:(void(^)(DXObjectMapping *mapping))block
{
    [[self class] mappingForObject:objectClass block:(void(^)(BWObjectMapping *mapping))block];
}

- (void)registerMapping:(DXObjectMapping *)aMapping
{
    [[[self class] objectMapper] registerMapping:aMapping];
}

-(void)registerMapping:(DXObjectMapping*)aMapping withRootKeyPath:(NSString *)aRootKeyPath
{
    [[[self class] objectMapper] registerMapping:aMapping withRootKeyPath:aRootKeyPath];
}

- (void)objectWithBlock:(BWObjectMappingObjectBlock)objectBlock
{
    [[[self class] objectMapper] objectWithBlock:objectBlock];
}

+ (NSArray *)objectsFromJSON:(id)JSON
{
    [self loadMappings];
    
    return [[self objectMapper] objectsFromJSON:JSON];
}

- (void)setupMapping
{
    
}

@end