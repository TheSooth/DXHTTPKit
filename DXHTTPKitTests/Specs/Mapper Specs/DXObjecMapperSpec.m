#import "Kiwi.h"
#import "DXMapperTestClass.h"
#import "DXObjectMapper.h"

SPEC_BEGIN(DXObjectMapperSpec)

describe(@"DXObjectMapper", ^{
    __block DXObjectMapper *objectMapper;
    beforeEach(^{
        objectMapper = [DXObjectMapper new];
    });
    
    it(@"Should assing values to class properties", ^{
        DXMapperTestClass *testClass = [DXMapperTestClass new];
        NSDictionary *valuesDict = @{@"userName" : @"user", @"userPostText" : @"Some posting text"};
        
        [objectMapper setValuesOnObject:testClass withDictionary:valuesDict];
        
        [[testClass.userName should] equal:@"user"];
        [[testClass.userPostText should] equal:@"Some posting text"];
    });
});
    
SPEC_END