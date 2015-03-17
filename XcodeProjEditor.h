//
//  XcodeProjEditor.h
//  BuildFaster
//
//  Created by zuckchen on 3/16/15.
//  Copyright (c) 2015 zuckchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XcodeProjEditor : NSObject

- (id)initWithFilePath:(NSString*)filePath;

- (NSString*)stringWithNodeName:(NSString*)nodeName;
- (void)replaceString:(NSString*)str withNodeName:(NSString*)nodeName;

- (void)save;

@end
