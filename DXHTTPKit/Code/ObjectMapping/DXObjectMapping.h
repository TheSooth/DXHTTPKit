//
//  DXObjectMapping.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/26/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <BWObjectMapping/BWObjectMapping.h>
#import <BWObjectMapping/BWObjectMapper.h>

@interface DXObjectMapping : BWObjectMapping

- (void)setupMapping;

- (void)mappingForObject:(Class)objectClass block:(void(^)(DXObjectMapping *mapping))block; 

- (void)registerMapping:(DXObjectMapping *)aMapping;

- (void)registerMapping:(DXObjectMapping*)aMapping withRootKeyPath:(NSString *)aRootKeyPath;

- (void)objectWithBlock:(BWObjectMappingObjectBlock)objectBlock;

+ (NSArray *)objectsFromJSON:(id)JSON;

@end
