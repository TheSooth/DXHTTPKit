//
//  DXHTTPConnection.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPConnectionSource.h"
#import "DXJSONParser.h"

@implementation DXHTTPConnectionSource

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation didFinishRequestWithData:(NSData *)returnedData urlResponse:(NSURLResponse *)aURLResponse {
    
    [self.dataMapper mappingObjectsFromData:returnedData];
}

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation downloadedBytes:(NSUInteger)aDownloadBytes totalBytes:(long long)aTotalBytes {
    NSLog(@"dowloaded bytes = %u", aDownloadBytes);
}

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation willReceivedError:(NSError *)aError urlResponse:(NSURLResponse *)aURLResponse
{
    NSLog(@"Connection Erorr");
}

@end
