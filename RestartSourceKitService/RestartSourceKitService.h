//
//  RestartSourceKitService.h
//  RestartSourceKitService
//
//  Created by hewigovens on 5/4/16.
//  Copyright © 2016 hewigovens. All rights reserved.
//

#import <AppKit/AppKit.h>

@class RestartSourceKitService;

static RestartSourceKitService *sharedPlugin;

@interface RestartSourceKitService : NSObject

+ (instancetype)sharedPlugin;
- (id)initWithBundle:(NSBundle *)plugin;

@property (nonatomic, strong, readonly) NSBundle* bundle;
@end