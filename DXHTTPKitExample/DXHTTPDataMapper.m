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
#import "DXTweetUser.h"

@implementation DXHTTPDataMapper

- (void)mappingObjectsFromData:(NSData *)aData {
    id parsedData = [DXJSONParser dictionaryForJSONData:aData];
    self.tweetsArray = [DXObjectMapping objectsFromJSON:parsedData forMappedClass:[DXTweets class]];
    self.tweetUserArray = [DXObjectMapping objectsFromJSON:parsedData forMappedClass:nil];
    [self showMappedObjects];
}

- (void)showMappedObjects {
    for (DXTweets *tweet in self.tweetsArray) {
        NSLog(@"tweet.text = %@", tweet.text);
        NSLog(@"tweet.source = %@", tweet.source);
    }
    
    for (DXTweetUser *user in self.tweetUserArray) {
        NSLog(@"tweetUser.name = %@", user.name);
        NSLog(@"tweetUser.screenName = %@", user.screenName);
    }
}

@end
