//
//  DXHTTPAppDelegate.m
//  DXHTTPKitExample
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPAppDelegate.h"
#import "DXHTTPConnection.h"
#import "DXHTTPRequestDescriptor.h"
#import "DXHTTPRequestBuilder.h"
#import "DXHTTPConnectionSource.h"
#import "DXTweets.h"


@implementation DXHTTPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    DXHTTPDataMapper *dataMapper = [DXHTTPDataMapper new];
    
    DXHTTPRequestDescriptor *requestDescriptor = [DXHTTPRequestDescriptor new];
    [requestDescriptor setBaseURL:@"https://api.twitter.com"];
    [requestDescriptor setPath:@"/1/statuses/user_timeline.json"];
    [requestDescriptor addParam:@"screen_name" value:@"sergeyzenchenko"];
    [requestDescriptor addParam:@"count" value:@"2"];
    [requestDescriptor setHttpMethod:DXHTTPMethod.GET];
    
    NSURLRequest *urlRequest = [[DXHTTPRequestBuilder new] buildRequest:requestDescriptor];
    DXHTTPConnectionSource *httpConnection = [DXHTTPConnectionSource new];
    httpConnection.dataMapper = dataMapper;
    
    DXHTTPConnectionDescriptor *connectionDescriptor = [DXHTTPConnectionDescriptor new];
    [connectionDescriptor setUrlRequest:urlRequest];
    
    DXHTTPConnectionOperation *connectionOperation = [[DXHTTPConnectionOperation alloc] initWithConnectionDescriptor:connectionDescriptor];
    
    [connectionOperation start];
    
    connectionOperation.delegate = httpConnection;
    
    return YES;
}
@end
