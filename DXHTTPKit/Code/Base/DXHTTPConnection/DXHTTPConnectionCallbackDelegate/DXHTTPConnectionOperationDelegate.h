//
//  DXHTTPConnectionOperationDelegate.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/23/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXHTTPConnectionOperation.h"

@class DXHTTPConnectionOperation;

@protocol DXHTTPConnectionOperationDelegate <NSObject>

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation willReturnedData:(NSData *)aReturnedData urlResponse:(NSURLResponse *)aURLResponse;

- (void)connectionOperation:(DXHTTPConnectionOperation *)connectionOperation willReceivedError:(NSError *)aError urlResponse:(NSURLResponse *)aURLResponse;

- (void)connectionOperationDidFinished:(DXHTTPConnectionOperation *)connectionOperation;

@end
