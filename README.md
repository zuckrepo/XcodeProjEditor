# XcodeProjEditor
A Simple Utility Class to Process Pbxproj File.  

# Usage  

**Create a XcodeProjEditor Object**  

    XcodeProjEditor* editor = [[XcodeProjEditor alloc]initWithFilePath:projFilePath];

**Get String Contents with Node Name**  

    NSString* content = [editor stringWithNodeName:@"Supporting Files"];  

**Modify String Contents**

    NSString* newContent = [content stringByReplacingOccurrencesOfString:@"isa = PBXGroup;" withString:@"isa = PBX;"];

**Replace with New String Contents**  

    [editor replaceString:newContent withNodeName:nodeName];  

**Save Changes**  

    [editor save];  

# Particularly

**Get All String Contents in Pbxproj Files**

    NSString* allContent = [editor stringWithNodeName:nil];

**Replace with New String Contents in File**  

    [editor replaceString:newContent withNodeName:nil];
