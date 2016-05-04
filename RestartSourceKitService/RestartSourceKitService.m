//
//  RestartSourceKitService.m
//  RestartSourceKitService
//
//  Created by hewigovens on 5/4/16.
//  Copyright © 2016 hewigovens. All rights reserved.
//

#import "RestartSourceKitService.h"

@interface RestartSourceKitService()

@property (nonatomic, strong, readwrite) NSBundle *bundle;
@end

@implementation RestartSourceKitService

+ (instancetype)sharedPlugin
{
    return sharedPlugin;
}

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        // reference to plugin's bundle, for resource access
        self.bundle = plugin;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(didApplicationFinishLaunchingNotification:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }
    return self;
}

- (void)didApplicationFinishLaunchingNotification:(NSNotification*)noti
{
    //removeObserver
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NSApplicationDidFinishLaunchingNotification object:nil];
    
    NSMenuItem *menuItem = [[NSApp mainMenu] itemWithTitle:@"Debug"];
    if (menuItem) {
        [[menuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *actionMenuItem = [[NSMenuItem alloc] initWithTitle:@"Restart SourceKitService!" action:@selector(doMenuAction) keyEquivalent:@"r"];
        [actionMenuItem setTarget:self];
        [[menuItem submenu] addItem:actionMenuItem];
    }
}

- (void)doMenuAction
{
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:@"do shell script \"sudo killall SourceKitService\" with administrator privileges"];
    [script executeAndReturnError:nil];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
