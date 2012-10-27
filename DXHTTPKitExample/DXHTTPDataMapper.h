//
//  DXHTTPDataMapper.h
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXHTTPDataMapper : NSObject

@property (nonatomic, strong) NSArray *tweetsArray;

-(void)mappingObjectsFromData:(NSData *)aData;
@end
