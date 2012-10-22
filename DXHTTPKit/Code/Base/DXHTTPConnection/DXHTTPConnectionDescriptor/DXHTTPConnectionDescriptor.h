//
//  DXHTTPConnectionDescriptor.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/22/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DXHTTPConnectionDescriptor : NSObject

- (void)setAuthCredential:(NSString *)aUserName password:(NSString *)aPassword;

@property (nonatomic, strong, readonly) NSURLCredential *urlCredential;

@property (nonatomic, strong) NSURLRequest *urlRequest;
@end
