//
//  AppDelegate.h
//  IPMenu
//
//  Created by S. R. on 02/08/12.
//  Copyright (c) 2012 Unregular Expression. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    // the menu which will be attached to the system status bar
    IBOutlet NSMenu *menu;
    
    IBOutlet NSMenuItem *quit;
    IBOutlet NSMenuItem *externalIPAddress;
    
    // the system status bar which the system provides to us
	NSStatusItem *statusItem;
    
    //timer dedicated to refresh ext. ip address every 1000s
    NSTimer *updateTimer;
    
    NSImage *menuIcon;
}

-(IBAction)updateIPAddress:(id)sender;

-(IBAction)exitApplication:(id)sender;

@end
