//
//  DXHTTPConnection.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/23/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DXHTTPConnectionOperationDelegate.h"

@interface DXHTTPConnection : NSObject
+ (void)showNetworkActivityIndicator;

+ (void)hideNetworkActivityIndicator;

@end
