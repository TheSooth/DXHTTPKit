//
//  DXTweetUser.h
//  DXHTTPKit
//
//  Created by TheSooth on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXObjectMapping.h"

@interface DXTweetUser : DXObjectMapping

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *screenName;
@end
