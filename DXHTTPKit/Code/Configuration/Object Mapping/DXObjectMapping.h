//
//  DXObjectMapping.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/26/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <DXObjectMapping/BWObjectMapping.h>
#import <DXObjectMapping/BWObjectMapper.h>
#import "DXConfiguration.h"

@interface DXObjectMapping : DXConfiguration

+ (void)setup;

+ (void)mappingForObject:(Class)objectClass block:(void(^)(BWObjectMapping *mapping))block;

+ (void)registerMapping:(BWObjectMapping *)aMapping;

+ (void)registerMapping:(BWObjectMapping*)aMapping withRootKeyPath:(NSString *)aRootKeyPath;

+ (void)objectWithBlock:(BWObjectMappingObjectBlock)objectBlock;

+ (id)objectFromJSON:(id)JSON withObjectClass:(Class)objectClass;

+ (NSArray *)objectsFromJSON:(id)JSON forMappedClass:(Class)aMappedClass;
@end
