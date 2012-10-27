//
//  DXHTTPDataMapper.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPDataMapper.h"
#import "DXJSONParser.h"
#import "DXObjectMapping.h"
#import "DXTweets.h"

@implementation DXHTTPDataMapper

- (void)mappingObjectsFromData:(NSData *)aData {
    id parsedData = [DXJSONParser dictionaryForJSONData:aData];
    self.tweetsArray = [DXObjectMapping objectsFromJSON:parsedData forMappedClass:[DXTweets class]];
    [self showMappedObjects];
}

- (void)showMappedObjects {
    for (DXTweets *tweet in self.tweetsArray) {
        NSLog(@"username = %@", tweet.text);
    }
}

@end
