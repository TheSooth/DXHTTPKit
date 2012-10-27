//
//  DXHTTPConnection.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/23/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPConnection.h"

@interface DXHTTPConnection()

@property (nonatomic, strong, readwrite) NSData *receivedData;
@end

@implementation DXHTTPConnection

+ (void)showNetworkActivityIndicator
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

+ (void)hideNetworkActivityIndicator
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
