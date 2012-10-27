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
    NSMutableDictionary *_connectionResponseHeaders;
    NSURLCredential *_urlCredential;
    BOOL _executing;
    BOOL _finished;
}

@property (nonatomic, strong, readwrite) NSURLResponse *urlResponse;
@property (nonatomic, strong, readwrite) DXHTTPConnectionOperationProgressBlock downloadProgress;
@property (nonatomic, strong, readwrite) NSData *receivedData;
@property (nonatomic, assign, readwrite) long long totalBytesRead;
@property (nonatomic, strong, readwrite) NSOutputStream *connectionOutputStream;

@end

@implementation DXHTTPConnectionOperation

- (id)initWithConnectionDescriptor:(DXHTTPConnectionDescriptor *)aConnectionDescriptor
{
    DXParametrAssert(aConnectionDescriptor.urlRequest, DXHTTPKitErrors.EmptyURLRequest);
    
    self = [super init];
    if (self) {
        _urlCredential = aConnectionDescriptor.urlCredential;
        _urlRequest = aConnectionDescriptor.urlRequest;
        _connectionOutputStream = [NSOutputStream outputStreamToMemory];
    }
    return self;
}

#pragma mark - NSURLConnection delegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _urlResponse = response;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [_connectionOutputStream open];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    _totalBytesRead += [data length];
    if ([_connectionOutputStream hasSpaceAvailable]) {
        const uint8_t *receivedDataBuffer = (uint8_t *) [data bytes];
        
        [_connectionOutputStream write:receivedDataBuffer maxLength:[data length]];
    }
}

- (void)connection:(NSURLConnection *)connection didCancelAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge previousFailureCount] == 0) {
        [[challenge sender] useCredential:_urlCredential forAuthenticationChallenge:challenge];
    } else {
        [[challenge sender] cancelAuthenticationChallenge:challenge];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _receivedData = [_connectionOutputStream propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    [_connectionOutputStream close];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    [self.delegate connectionOperation:self didFinishRequestWithData:self.receivedData urlResponse:_urlResponse];
    [self.delegate connectionOperation:self downloadedBytes:[_receivedData length] totalBytes:_urlResponse.expectedContentLength];

}

#pragma mark - NSOperation delegate methods

- (BOOL)isExecuting
{
    return _executing;
}

- (BOOL)isFinished
{
    return _finished;
}

- (BOOL)isConcurrent
{
    return YES;
}

#pragma mark - DXHTTPConnectionOperation methods

- (void)start
{
    _executing = YES;
    [self performSelector:@selector(connectionOpeartionDidStart) onThread:[DXHTTPConnectionThread requestConnectionThread] withObject:nil waitUntilDone:NO];
    
}

- (void)connectionOpeartionDidStart
{
    _urlConnection = [[NSURLConnection alloc] initWithRequest:_urlRequest delegate:self];
    NSRunLoop *connectionRunLoop = [NSRunLoop currentRunLoop];
    
    [_urlConnection scheduleInRunLoop:connectionRunLoop forMode:NSRunLoopCommonModes];
    [_connectionOutputStream scheduleInRunLoop:connectionRunLoop forMode:NSRunLoopCommonModes];
    
    [_urlConnection start];
}

- (void)setDownloadProgressBlock:(void (^)(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead))block
{
    _downloadProgress = block;
}

@end
