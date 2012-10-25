#import "Kiwi.h"
#import "DXJSONParser.h"

SPEC_BEGIN(DXJSONParserSpec)

describe(@"DXJSONParser", ^{
    it(@"Should parse data in to NSDictionary", ^{
        NSString *jsonFiePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"user" ofType:@"json"];
        NSDictionary *jsonParsedDictionary = [DXJSONParser dictionaryForJSONData:[NSData dataWithContentsOfFile:jsonFiePath]];
        
        [[theValue([[jsonParsedDictionary objectForKey:@"phoneNumber"] count]) should] equal:theValue(2)];
    });
});

SPEC_END