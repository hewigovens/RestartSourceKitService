//
//  NSObject_Extension.m
//  RestartSourceKitService
//
//  Created by hewigovens on 5/4/16.
//  Copyright © 2016 hewigovens. All rights reserved.
//


#import "NSObject_Extension.h"
#import "RestartSourceKitService.h"

@implementation NSObject (Xcode_Plugin_Template_Extension)

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[RestartSourceKitService alloc] initWithBundle:plugin];
        });
    }
}
@end
