//
//  DXJSONParser.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXJSONParser : NSObject

+ (id)dictionaryForJSONData:(NSData *)aData;
@end
