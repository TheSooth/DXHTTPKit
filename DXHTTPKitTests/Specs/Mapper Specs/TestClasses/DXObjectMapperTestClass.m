#import "DXObjectMapperTestClass.h"
#import "DXPhoneNumberTestClass.h"

@implementation DXObjectMapperTestClass

+ (void)setup
{
    [self mappingForObject:[DXPhoneNumberTestClass class] block:^(BWObjectMapping *mapping) {
        [mapping mapKeyPath:@"type" toAttribute:@"type"];
        [mapping mapKeyPath:@"number" toAttribute:@"number"];
        
        [self registerMapping:mapping withRootKeyPath:@"phoneNumber"];
    }];
    
    [self objectWithBlock:^id(Class objectClass, NSString *primaryKey, id primaryKeyValue, id JSON) {
        return [[objectClass alloc] init];
    }];
}

@end