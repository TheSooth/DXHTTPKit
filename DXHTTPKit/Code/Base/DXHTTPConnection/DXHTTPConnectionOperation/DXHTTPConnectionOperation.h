//
//  DXHTTPConnectionOperation.h
//  DXHTTPKit
//
//  Created by dev2 on 10/22/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXHTTPConnectionThread.h"
#import "DXHTTPConnectionDescriptor.h"
#import "DXHTTPKitErrors.h"
#import "DXHTTPConnectionOperationDelegate.h"

typedef void (^DXHTTPConnectionOperationProgressBlock)(NSUInteger bytes, long long totalBytes, long long totalBytesExpected);

@protocol DXHTTPConnectionOperationDelegate;

@interface DXHTTPConnectionOperation : NSOperation <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    id <DXHTTPConnectionOperationDelegate> _delegate;
}

@property (nonatomic, strong, readonly) NSURLConnection *urlConnection;

@property (nonatomic, strong, readonly) NSData *receivedData;

@property (nonatomic, strong) id <DXHTTPConnectionOperationDelegate> delegate;

- (id)initWithConnectionDescriptor:(DXHTTPConnectionDescriptor *)aConnectionDescriptor;


@end
