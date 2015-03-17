//
//  XcodeProjEditor.m
//  BuildFaster
//
//  Created by zuckchen on 3/16/15.
//  Copyright (c) 2015 zuckchen. All rights reserved.
//

#import "XcodeProjEditor.h"

@interface XcodeProjEditor ()

@property (nonatomic, strong) NSString* filePath;
@property (nonatomic, strong) NSString* projContent;

@end

@implementation XcodeProjEditor

- (id)initWithFilePath:(NSString*)filePath
{
    self = [super init];
    if (self) {
        _filePath = filePath;
        
        NSData* data = [[NSFileManager defaultManager] contentsAtPath:_filePath];
        _projContent = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSString*)stringWithNodeName:(NSString*)nodeName
{
    if (!_projContent || _projContent.length == 0) {
        return nil;
    }
    
    if (nodeName == nil) {
        return _projContent;
    }
    
    NSString* temp = [NSString stringWithFormat:@"/* %@ */ = {", nodeName];
    NSRange range = [_projContent rangeOfString:temp options:NSCaseInsensitiveSearch];
    if (range.location == NSNotFound) {
        return nil;
    }
    NSInteger startPos = range.location + range.length;
    NSInteger endPos = startPos;
    NSInteger length = _projContent.length;
    BOOL shouldBreak = YES;
    while (endPos < length) {
        char s = [_projContent characterAtIndex:endPos];
        if (s == '{') {
            shouldBreak = NO;
        }
        else if (s == '}') {
            if (shouldBreak == YES) {
                break;
            }
            else {
                shouldBreak = YES;
            }
        }
        
        endPos++;
    }
    
    if (endPos < length) {
        return [_projContent substringWithRange:NSMakeRange(startPos, endPos - startPos)];
    }
    
    return nil;
}

- (void)replaceString:(NSString*)str withNodeName:(NSString*)nodeName
{
    if (!_projContent || _projContent.length == 0) {
        return;
    }
    
    if (nodeName == nil) {
        _projContent = str;
        return;
    }
    
    NSString* temp = [NSString stringWithFormat:@"/* %@ */ = {", nodeName];
    NSRange range = [_projContent rangeOfString:temp options:NSCaseInsensitiveSearch];
    if (range.location == NSNotFound) {
        return;
    }
    NSInteger startPos = range.location + range.length;
    NSInteger endPos = startPos;
    NSInteger length = _projContent.length;
    BOOL shouldBreak = YES;
    while (endPos < length) {
        char s = [_projContent characterAtIndex:endPos];
        if (s == '{') {
            shouldBreak = NO;
        }
        else if (s == '}') {
            if (shouldBreak == YES) {
                break;
            }
            else {
                shouldBreak = YES;
            }
        }
        
        endPos++;
    }
    
    if (endPos < length) {
        _projContent = [_projContent stringByReplacingCharactersInRange:NSMakeRange(startPos, endPos - startPos) withString:str];
    }
    
    return;
}

- (void)save
{
    if (_projContent) {
        [_projContent writeToFile:_filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
}

@end
