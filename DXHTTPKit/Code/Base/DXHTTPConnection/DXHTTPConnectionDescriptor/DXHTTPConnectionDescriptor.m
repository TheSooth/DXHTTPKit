//
//  DXHTTPConnectionDescriptor.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/22/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXHTTPConnectionDescriptor.h"
@interface DXHTTPConnectionDescriptor() {
    NSURLCredential *_urlCredential;
}
@property (nonatomic, strong, readwrite) NSURLCredential *urlCredential;
@end

@implementation DXHTTPConnectionDescriptor

- (void)setAuthCredential:(NSString *)aUserName password:(NSString *)aPassword {
    _urlCredential = [[NSURLCredential alloc] initWithUser:aUserName password:aPassword persistence:NSURLCredentialPersistenceForSession];
}


@end
