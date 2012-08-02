//
//  AppDelegate.m
//  IPMenu
//
//  Created by S. R. on 02/08/12.
//  Copyright (c) 2012 Unregular Expression. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}


- (void)awakeFromNib
{
    //the status item is of variable length: the area will grow and shrink depending on the content of the status item's title or icon.
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    
    //a box is drawn around the status item when clicked
    [statusItem setHighlightMode:YES];
    
    //determines if the menulet is grayed out or darkened.
    [statusItem setEnabled:YES];
    
    [statusItem setToolTip:@"IPMenu"];
    
    //set the functions that should be called when a user clicks on the menulet.
    //[statusItem setAction:@selector(updateIPAddress:)];
    //[statusItem setTarget:self];

    //-- setting the icon
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [bundle pathForResource:@"ip_icon" ofType:@"gif"];
    menuIcon= [[NSImage alloc] initWithContentsOfFile:path];
    [statusItem setTitle:@""];
    [statusItem setImage:menuIcon];
    
    externalIPAddress = [[NSMenuItem alloc] initWithTitle:@"0.0.0.0" action:@selector(updateIPAddress:) keyEquivalent:@""];
    [externalIPAddress setTarget:self];
    
    [menu insertItem:externalIPAddress atIndex:0];
    
    [statusItem setMenu:menu];
    
    updateTimer = [NSTimer
                    scheduledTimerWithTimeInterval:(1000.0)
                    target:self
                    selector:@selector(updateIPAddress:)
                    userInfo:nil
                    repeats:YES];
    [updateTimer fire];
}

-(IBAction)updateIPAddress:(id)sender
{
    NSString *ipAddr = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://highearthorbit.com/service/myip.php"] encoding:NSASCIIStringEncoding error:nil];
    NSLog(@"Updating IP Address...");
    if (ipAddr != NULL)
        [externalIPAddress setTitle:[NSString stringWithFormat:@"External IP Address: %@",[NSString stringWithString:ipAddr]]];
    NSLog(@"Updating IP Address: done.");
}


-(IBAction)exitApplication:(id)sender
{
	NSLog(@"Exiting application...");
	
	[[NSApplication sharedApplication] terminate:nil];
}

@end
