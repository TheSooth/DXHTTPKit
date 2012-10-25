//
//  DXObjectMapper.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXPropertyFinder.h"
#import "DXAttributeSetter.h"

@interface DXObjectMapper : NSObject

@property(nonatomic, readonly) Class classToGenerate;

- (id)initWithClassToGenerate:(Class)aClassToGenerate;
- (void)setValuesOnObject:(id)aObject withDictionary:(NSDictionary *)aDictionary;
- (NSArray *)parseArray:(NSArray *)aArray;
- (id) parseDictionary:(NSDictionary *)aDictionary;
@end
