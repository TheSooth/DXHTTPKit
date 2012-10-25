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

@property(nonatomic, readonly) Class classReference;

- (void) setValuesOnObject: (id) object withDictionary: (NSDictionary *) dictionary;
@end
