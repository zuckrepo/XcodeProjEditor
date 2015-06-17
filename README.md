# XcodeProjEditor
A Simple Utility ObjC Class to Process Pbxproj File.  

# Usage  

**Create a XcodeProjEditor Object**  

    XcodeProjEditor* editor = [[XcodeProjEditor alloc]initWithFilePath:projFilePath];

**Get String Contents**  

    NSString* content = [editor stringWithNodeName:@"Supporting Files" nodeId:@"D888888888888888888888888"];  

**Modify String Contents**

    NSString* newContent = [content stringByReplacingOccurrencesOfString:@"isa = PBXGroup;" withString:@"isa = PBX;"];

**Replace with New String Contents**  

    [editor replaceString:newContent withNodeName::@"Supporting Files" nodeId:@"D888888888888888888888888"];  

**Save Changes**  

    [editor save];  

# Particularly

**Get All String Contents in Pbxproj Files**

    NSString* allContent = [editor stringWithNodeName:nil nodeId:nil];

**Replace with New String Contents in File**  

    [editor replaceString:newContent withNodeName:nil nodeId:nil];
