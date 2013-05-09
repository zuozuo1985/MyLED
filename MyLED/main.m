//
//  main.m
//  MyLED
//
//  Created by  on 12-2-16.
//  Copyright (c) 2012年 IDS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "wintelAppDelegate.h"

int main(int argc, char *argv[])
{
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([wintelAppDelegate class]));
    [pool release];
    return retVal;
/*	
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([wintelAppDelegate class]));
    }*/
}
