//
//  DXJSONParser.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXJSONParser.h"

@implementation DXJSONParser

+ (NSDictionary *)dictionaryForJSONData:(NSData *)aData {
    return [NSJSONSerialization JSONObjectWithData:aData options:NSJSONReadingMutableContainers error:nil];
}
@end
