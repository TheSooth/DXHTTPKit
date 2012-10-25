#import "Kiwi.h"
#import "DXHTTPConnectionOperation.h"
#import "DXHTTPRequestBuilder.h"

SPEC_BEGIN(DXHTTPConnectionOperationSpec)

describe(@"DXHTTPConnectionOperationSpec", ^{
    
    __block DXHTTPConnectionOperation *connectionOperation;
    __block NSURLRequest *urlRequest;
    __block DXHTTPConnectionDescriptor *connectionDescriptor;
    
    beforeEach(^{
        urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://localhost"]];
        connectionDescriptor = [DXHTTPConnectionDescriptor new];
        [connectionDescriptor setUrlRequest:urlRequest];
        connectionOperation = [[DXHTTPConnectionOperation alloc] initWithConnectionDescriptor:connectionDescriptor];
        [connectionOperation start];
    });
    
    context(@"Right values", ^{
        
        it(@"DXHTTPConnection should be executing", ^{
            [[theValue([connectionOperation isExecuting]) should] beTrue];
        });
        
        it(@"Should set connectionData in DXHTTPConnectionOperation", ^{
            NSData *dataForTesting = [[NSString stringWithFormat:@"Data for Testing"] dataUsingEncoding:NSUTF8StringEncoding];
            [connectionOperation connection:[connectionOperation urlConnection] didReceiveResponse:nil];

            [connectionOperation connection:[connectionOperation urlConnection] didReceiveData:dataForTesting];
            [connectionOperation connectionDidFinishLoading:[connectionOperation urlConnection]];
            
            [[[connectionOperation receivedData] should] equal:dataForTesting];
        });
        
        it(@"Data in connectionOperation should be zero in time of resiveResponce", ^{
            [connectionOperation connection:[connectionOperation urlConnection] didReceiveResponse:nil];
            [[theValue([[connectionOperation receivedData] length]) should] equal:theValue(0)];
        });
        
        it(@"DXConnectionOperation shoul be concurrent", ^{
            [[theValue([connectionOperation isConcurrent]) should] beTrue];
        });
    });
    
    context(@"invalid values", ^{
        
        it(@"Should throw in case of empty urlRequest", ^{
            connectionDescriptor = [DXHTTPConnectionDescriptor new];
            [[theBlock(^{
                connectionOperation = [[DXHTTPConnectionOperation alloc] initWithConnectionDescriptor:connectionDescriptor];
            }) should] raiseWithName:DXHTTPKitErrors.EmptyURLRequest];
        });
        
    });
});

SPEC_END