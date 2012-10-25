//
//  DXXMLParser.m
//  DXHTTPKit
//
//  Created by TheSooth on 10/25/12.
//  Copyright (c) 2012 111Minutes. All rights reserved.
//

#import "DXXMLParser.h"
@interface DXXMLParser() {
    NSMutableArray *_dictionaryStack;
    NSMutableString *_textInProgress;
}

- (NSDictionary *)objectWithData:(NSData *)data;

@end

@implementation DXXMLParser

#pragma mark -
#pragma mark Public methods

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data
{
    DXXMLParser *reader = [[DXXMLParser alloc] init];
    NSDictionary *rootDictionary = [reader objectWithData:data];
    return rootDictionary;
}

#pragma mark -
#pragma mark Parsing


- (NSDictionary *)objectWithData:(NSData *)data
{
    _dictionaryStack = [[NSMutableArray alloc] init];
    _textInProgress = [[NSMutableString alloc] init];
    
    [_dictionaryStack addObject:[NSMutableDictionary dictionary]];
    
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    BOOL success = [parser parse];
    
    if (success)
    {
        NSDictionary *resultDict = [_dictionaryStack objectAtIndex:0];
        return resultDict;
    }
    
    return nil;
}

#pragma mark -
#pragma mark NSXMLParserDelegate methods

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    NSMutableDictionary *parentDict = [_dictionaryStack lastObject];
    
    NSMutableDictionary *childDict = [NSMutableDictionary dictionary];
    
    for (NSString *key in attributeDict) {
        [childDict setValue:[attributeDict objectForKey:key] forKey: key];
    }
    
    id existingValue = [parentDict objectForKey:elementName];
    
    if (existingValue)
    {
        NSMutableArray *array = nil;
        
        if ([existingValue isKindOfClass:[NSMutableArray class]])
        {
            array = (NSMutableArray *) existingValue;
        }
        else
        {
            array = [NSMutableArray array];
            [array addObject:existingValue];
            
            [parentDict setObject:array forKey:elementName];
        }
        
        [array addObject:childDict];
    }
    else
    {
        [parentDict setObject:childDict forKey:elementName];
    }
    
    [_dictionaryStack addObject:childDict];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSMutableDictionary *dictInProgress = [_dictionaryStack lastObject];
    [_dictionaryStack removeLastObject];
    
    if ([_textInProgress length] > 0)
    {
        if ([dictInProgress count] > 0)
        {
            [dictInProgress setObject:_textInProgress forKey:@""];
        }
        else
        {
            NSMutableDictionary *parentDict = [_dictionaryStack lastObject];
            id parentObject = [parentDict objectForKey:elementName];
            
            if ([parentObject isKindOfClass:[NSArray class]])
            {
                [parentObject removeLastObject];
                [parentObject addObject:_textInProgress];
            }
            
            else
            {
                [parentDict removeObjectForKey:elementName];
                [parentDict setObject:_textInProgress forKey:elementName];
            }
        }
        
        _textInProgress = [NSMutableString stringWithString:@""];
    }
    
    else if ([dictInProgress count] == 0)
    {
        NSMutableDictionary *parentDict = [_dictionaryStack lastObject];
        [parentDict removeObjectForKey:elementName];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (![_textInProgress isEqualToString:@""]){
        [_textInProgress appendString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    } else {
        _textInProgress = [NSMutableString stringWithString:[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]];
    }
}

@end