//
//  DXMappingClass.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXMappingClass.h"
#import "DXTweets.h"

@implementation DXMappingClass

+ (void)setup
{
    [self mappingForObject:[DXTweets class] block:^(BWObjectMapping *mapping) {
        [mapping mapKeyPath:@"text" toAttribute:@"text"];
        [mapping mapKeyPath:@"source" toAttribute:@"source"];
        
        [self registerMapping:mapping];
    }];
    
    [self objectWithBlock:^id(Class objectClass, NSString *primaryKey, id primaryKeyValue, id JSON) {
        return [[objectClass alloc] init];
    }];
}

@end
