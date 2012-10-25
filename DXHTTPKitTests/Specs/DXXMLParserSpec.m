#import "Kiwi.h"
#import "DXXMLParser.h"

SPEC_BEGIN(DXXMLParserSpec)

describe(@"DXXMLParser", ^{
    it(@"Should parse data in to NSDictionary", ^{
        NSString *xmlFilePath = [[NSBundle bundleForClass: [self class]] pathForResource:@"books" ofType:@"xml"];
        NSDictionary *xmlParsedDictionary = [DXXMLParser dictionaryForXMLData:[NSData dataWithContentsOfFile:xmlFilePath]];
        
        [[theValue([[[xmlParsedDictionary objectForKey:@"catalog"] objectForKey:@"book"] count]) should] equal:theValue(12)];
    });
});

SPEC_END