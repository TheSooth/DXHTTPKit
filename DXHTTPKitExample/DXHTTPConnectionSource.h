//
//  DXHTTPConnection.h
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DXHTTPConnectionOperationDelegate.h"
#import "DXHTTPDataMapper.h"

@interface DXHTTPConnectionSource : NSObject <DXHTTPConnectionOperationDelegate>

@property (nonatomic, strong) DXHTTPDataMapper *dataMapper;

@end
