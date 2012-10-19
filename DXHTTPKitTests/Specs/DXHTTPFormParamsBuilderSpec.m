#import "Kiwi.h"
#import "DXHTTPFormParamsBuilder.h"
#import "DXHTTPRequestDescriptor.h"

SPEC_BEGIN(DXHTTPFormParamsBuilderSpec)

describe(@"DXHTTPFormParamsBuilder", ^{
    
    __block DXHTTPFormParamsBuilder *paramsBuilder;
    __block NSURLRequest *urlRequest;
    __block DXHTTPRequestDescriptor *requestDescriptor;
    
    beforeEach(^{
        paramsBuilder = [DXHTTPFormParamsBuilder new];
        requestDescriptor = [DXHTTPRequestDescriptor new];
    });
    
    it(@"Should return urlRequest with builded url", ^{
        [requestDescriptor addParam:@"login" value:@"111minutes"];
        [requestDescriptor setHttpMethod:DXHTTPMethod.GET];
        
        urlRequest = [paramsBuilder buildParams:requestDescriptor];
        
        [[[[urlRequest URL] absoluteString] should] equal:@"?login=111minutes"];
    });
    it(@"Should return urlRequest with multipile params in url", ^{
        [requestDescriptor addParam:@"login" value:@"111minutes"];
        [requestDescriptor addParam:@"passwd" value:@"111"];
        [requestDescriptor setHttpMethod:DXHTTPMethod.GET];
        
        urlRequest = [paramsBuilder buildParams:requestDescriptor];
        
        [[[[urlRequest URL] absoluteString] should] equal:@"?login=111minutes&passwd=111"];
    });
    it(@"Should return urlRequest with multipile params in body", ^{
        NSData *bodyData = [@"?login=111minutes&passwd=111" dataUsingEncoding:NSUTF8StringEncoding];
        [requestDescriptor addParam:@"login" value:@"111minutes"];
        [requestDescriptor addParam:@"passwd" value:@"111"];
        [requestDescriptor setHttpMethod:DXHTTPMethod.POST];
        
        urlRequest = [paramsBuilder buildParams:requestDescriptor];
        
        [[[urlRequest HTTPBody] should] equal:bodyData];
    });
    it(@"Should return urlRequest, url must be without FileDescriptor", ^{
        [requestDescriptor addParam:@"login" value:@"111minutes"];
        [requestDescriptor addParam:@"file" value:[DXHTTPFormFileDescriptor fileDescriptorWithPath:@"/var/log/zzz.log"]];
        [requestDescriptor addParam:@"passwd" value:@"111"];
        
        NSLog(@"%@", [requestDescriptor.params description]);
        
        urlRequest = [paramsBuilder buildParams:requestDescriptor];
        
        [[[[urlRequest URL] absoluteString] should] equal:@"?login=111minutes&passwd=111"];
    });
    
    
});

SPEC_END