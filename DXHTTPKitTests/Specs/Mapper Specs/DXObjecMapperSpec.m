#import "Kiwi.h"
#import <BWObjectMapping/BWObjectMapper.h>
#import "DXPhoneNumberTestClass.h"
#import "DXJSONParser.h"
#import "DXObjectMapping.h"
#import "DXObjectMapperTestClass.h"



SPEC_BEGIN(DXObjectMapperSpec)

describe(@"DXObjectMapper", ^{
    it(@"Should map data to TestClass vars", ^{
        NSString *jsonFiePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"user" ofType:@"json"];
        NSDictionary *userJSON = [DXJSONParser dictionaryForJSONData:[NSData dataWithContentsOfFile:jsonFiePath]];
        NSArray *objects = [DXObjectMapping objectsFromJSON:userJSON];
        DXPhoneNumberTestClass *phone = [objects lastObject];
        Class class = [[objects lastObject] class];
        
        [[theValue(class) should] equal:theValue([DXPhoneNumberTestClass class])];
        [[theValue(objects.count) should] equal:theValue(2)];
        [[phone.type should] equal:@"fax"];
    });
});

SPEC_END