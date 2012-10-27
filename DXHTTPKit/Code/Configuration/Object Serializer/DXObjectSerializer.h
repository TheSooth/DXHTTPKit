//
//  DXObjectSerializer.h
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "BWObjectSerializer.h"
#import "DXConfiguration.h"

@interface DXObjectSerializerMapping : DXConfiguration

+ (void)setup;

- (void)mappingForObject:(Class)objectClass block:(void(^)(DXObjectSerializerMapping *mapping))block;

- (void)registerSerializer:(BWObjectSerializerMapping *)aSerializer withRootKeyPath:(NSString *)aKeyPath;

- (NSDictionary *)serializeObject:(id)aObject;

- (NSDictionary *)serializeObject:(id)aObject withMapping:(BWObjectSerializerMapping *)aMapping;
@end
