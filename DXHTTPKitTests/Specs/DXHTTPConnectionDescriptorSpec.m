#import "Kiwi.h"
#import "DXObjectMapper.h"
#import "DXHTTPConnectionOperation.h"

SPEC_BEGIN(DXHTTPConnectionDescriptorSpec)

describe(@"DXHTTPConnectionDescriptor", ^{
    __block DXHTTPConnectionDescriptor *connectionDescriptor;
    
    beforeEach(^{
        connectionDescriptor = [DXHTTPConnectionDescriptor new];
    });
    
});

SPEC_END