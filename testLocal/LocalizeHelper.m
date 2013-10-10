//
//  LocalizeHelper.m
//  iDeviceCheckout
//
//  Created by Mohit Jain on 4/10/13.
//  Copyright (c) 2013 Compuware. All rights reserved.
//

#import "LocalizeHelper.h"
#import "BAAppDelegate.h"

// Singleton
static LocalizeHelper* SingleLocalSystem = nil;

// my Bundle (not the main bundle!)
//  NSBundle* myBundle = nil;
static NSBundle* myBundle = nil;


@implementation LocalizeHelper


//-------------------------------------------------------------
// allways return the same singleton
//-------------------------------------------------------------
+ (LocalizeHelper*) sharedLocalSystem
{
    // lazy instantiation
    if (SingleLocalSystem == nil) {
        SingleLocalSystem = [[LocalizeHelper alloc] init];
    }
    return SingleLocalSystem;
}


//-------------------------------------------------------------
// initiating
//-------------------------------------------------------------
- (id) init
{
    self = [super init];
    if (self) {
        // use systems main bundle as default bundle
        myBundle = [NSBundle mainBundle];
    }
    return self;
}


//-------------------------------------------------------------
// translate a string
//-------------------------------------------------------------
// you can use this macro:
// LocalizedString(@"Text");
- (NSString*) localizedStringForKey:(NSString*) key
{
    // this is almost exactly what is done when calling the macro NSLocalizedString(@"Text",@"comment")
    // the difference is: here we do not use the systems main bundle, but a bundle
    // we selected manually before (see "setLanguage")
    return [myBundle localizedStringForKey:key value:@"" table:nil];
}


//-------------------------------------------------------------
// set a new language
//-------------------------------------------------------------
// you can use this macro:
// LocalizationSetLanguage(@"German") or LocalizationSetLanguage(@"de");
- (NSBundle *) setLanguage:(NSString*) lang
{
    // path to this languages bundle
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj" ];
    if (path == nil) {
        // there is no bundle for that language
        // use main bundle instead
        myBundle = [NSBundle mainBundle];
    } else {
        
        // use this bundle as my bundle from now on:
        myBundle = [NSBundle bundleWithPath:path];
        
        // to be absolutely shure (this is probably unnecessary):
        if (myBundle == nil) {
            myBundle = [NSBundle mainBundle];
        }
    }
    return myBundle;
}

- (UIImage *)setImage:(NSString *)imageString
{
    UIImage *image;
    BAAppDelegate *appDelegate = (BAAppDelegate*)[[UIApplication sharedApplication] delegate];
    NSBundle *selectedBundle = appDelegate.myBundle;
    image = [UIImage imageWithContentsOfFile:[selectedBundle pathForResource:imageString ofType:@"png"]];
    
    if (!image) {
       image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageString ofType:@"png"]];
    }
    
    return image;
}


@end