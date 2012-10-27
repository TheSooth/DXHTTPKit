//
//  DXObjectSetup.m
//  DXHTTPKit
//
//  Created by zen on 10/27/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXConfiguration.h"
#import <MAObjCRuntime/MARTNSObject.h>

@implementation DXConfiguration

+ (void)initialize
{
    [self setupObject:self withSelector:@selector(setup)];
}


+ (void)setupObject:(Class)aObject withSelector:(SEL)aSetupSelector {
    static NSMutableArray *subClassesList;
    static dispatch_once_t onceToken;
    static dispatch_queue_t subclassesSetupQueue;
    
    dispatch_once(&onceToken, ^{
        subClassesList = [NSMutableArray new];
        subclassesSetupQueue = dispatch_queue_create("com.111min.DXHTTPKit.subclassesSetupQueue", DISPATCH_QUEUE_CONCURRENT);
    });
    
    dispatch_sync(subclassesSetupQueue, ^{
        if (![subClassesList containsObject:aObject]) {
            NSArray *subclasses = [aObject rt_subclasses];
            for (Class cls in subclasses) {
                [subClassesList addObject:aObject];
                [cls performSelector:aSetupSelector];
            }
        }
    });
}

+ (void)setup
{
    
}

@end
