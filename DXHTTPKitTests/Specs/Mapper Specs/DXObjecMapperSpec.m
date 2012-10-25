#import "Kiwi.h"
#import "DXMapperTestClass.h"
#import "DXObjectMapper.h"
#import "DXPhoneNumberTestClass.h"

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
    
    it(@"Should parse array with dictionary and assing values to classes", ^{
        DXMapperTestClass *testClass = [DXMapperTestClass new];
        objectMapper = [[DXObjectMapper alloc] initWithClassToGenerate:[testClass class]];
        NSDictionary *valuesDict1 = @{@"userName" : @"user", @"userPostText" : @"Some posting text"};
        NSDictionary *valuesDict2 = @{@"userName" : @"user2", @"userPostText" : @"Some posting text2"};
        NSArray *valuesDict = @[valuesDict1, valuesDict2];
        
        NSArray *resultArray = [objectMapper parseArray:valuesDict];
        
        testClass = resultArray[0];
        [[testClass.userName should] equal:@"user"];
        testClass = resultArray[1];
        [[testClass.userPostText should] equal:@"Some posting text2"];
    });
    
    it(@"Should parse json file and map data to classes", ^{
        NSString *jsonFilePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"user" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:jsonFilePath];
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                               options:NSJSONReadingMutableContainers error:nil];
        NSMutableArray *resultArray = [NSMutableArray new];;
        
        NSArray *phoneArray = [json objectForKey:@"phoneNumber"];
        for (NSDictionary *item in phoneArray) {
            objectMapper = [[DXObjectMapper alloc] initWithClassToGenerate:[DXPhoneNumberTestClass class]];
            [resultArray addObject:[objectMapper parseDictionary:item]];
        }
        
        DXPhoneNumberTestClass *phoneNumberTestClass = resultArray[0];
        
        [[phoneNumberTestClass.number should] equal:@"212 555-1234"];
        
        phoneNumberTestClass = resultArray[1];
        
        [[phoneNumberTestClass.type should] equal:@"fax"];
    });
    
});
    
SPEC_END