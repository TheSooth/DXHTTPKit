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

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation willReturnedData:(NSData *)aReturnedData urlResponse:(NSURLResponse *)aURLResponse {
    self.receivedData = [aReturnedData copy];
}

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation willReceivedError:(NSError *)aError urlResponse:(NSURLResponse *)aURLResponse {
    
}

- (void)connectionOperationDidFinished:(DXHTTPConnectionOperation *)connectionOperation {
    
}

@end
