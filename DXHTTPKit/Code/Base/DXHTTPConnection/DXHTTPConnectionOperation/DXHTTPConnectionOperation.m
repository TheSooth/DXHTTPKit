//
//  DXHTTPConnectionOperation.m
//  DXHTTPKit
//
//  Created by dev2 on 10/22/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPConnectionOperation.h"

@interface DXHTTPConnectionOperation() {
    NSURLRequest *_urlRequest;
    NSURLConnection *_urlConnection;
    NSMutableData *_connectionData;
    NSMutableDictionary *_connectionResponseHeaders;
    NSURLCredential *_urlCredential;
    BOOL _executing;
    BOOL _finished;
}

@property (nonatomic, strong, readwrite)NSURLResponse *urlResponse;

@end

@implementation DXHTTPConnectionOperation

- (id)initWithConnectionDescriptor:(DXHTTPConnectionDescriptor *)aConnectionDescriptor {
    DXParametrAssert(aConnectionDescriptor.urlRequest, DXHTTPKitErrors.EmptyURLRequest);
    
    self = [super init];
    if (self) {
        _urlCredential = aConnectionDescriptor.urlCredential;
        _urlRequest = aConnectionDescriptor.urlRequest;
        _connectionData = [NSMutableData new];
    }
    return self;
}

- (void)start {
    _executing = YES;
    [self performSelector:@selector(connectionOpeartionDidStart) onThread:[DXHTTPConnectionThread requestConnectionThread] withObject:nil waitUntilDone:NO];
    
}

- (void)connectionOpeartionDidStart {
    _urlConnection = [[NSURLConnection alloc] initWithRequest:_urlRequest delegate:self];
    NSRunLoop *connectionRunLoop = [NSRunLoop currentRunLoop];
    [_urlConnection scheduleInRunLoop:connectionRunLoop forMode:NSRunLoopCommonModes];
    [_urlConnection start];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _urlResponse = response;
    [_connectionData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [_connectionData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    if ([challenge previousFailureCount] == 0) {
        [[challenge sender] useCredential:_urlCredential forAuthenticationChallenge:challenge];
    } else {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [self.delegate connectionOperation:self didFinishRequestWithData:_connectionData urlResponse:_urlResponse];
}

- (NSData *)connectionData {
    return _connectionData;
}

- (NSURLConnection *)urlConnection {
    return _urlConnection;
}

- (BOOL)isExecuting {
    return _executing;
}

- (BOOL)isFinished {
    return _finished;
}

- (BOOL)isConcurrent {
    return YES;
}

@end
