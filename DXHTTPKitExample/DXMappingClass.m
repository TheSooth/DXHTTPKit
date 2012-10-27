//
//  DXMappingClass.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXMappingClass.h"
#import "DXTweets.h"
#import "DXTweetUser.h"

@implementation DXMappingClass

+ (void)setup
{
    [self mappingForObject:[DXTweets class] block:^(BWObjectMapping *mapping) {
        [mapping mapKeyPath:@"text" toAttribute:@"text"];
        [mapping mapKeyPath:@"source" toAttribute:@"source"];
        
        [self registerMapping:mapping];
    }];
    
    [self mappingForObject:[DXTweetUser class] block:^(BWObjectMapping *mapping) {
        [mapping mapKeyPath:@"name" toAttribute:@"name"];
        [mapping mapKeyPath:@"screen_name" toAttribute:@"screenName"];
        
        [self registerMapping:mapping withRootKeyPath:@"user"];
    }];
    
    [self objectWithBlock:^id(Class objectClass, NSString *primaryKey, id primaryKeyValue, id JSON) {
        return [[objectClass alloc] init];
    }];
}

@end
