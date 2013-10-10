//
//  LocalizeHelper.h
//  iDeviceCheckout
//
//  Created by Mohit Jain on 4/10/13.
//  Copyright (c) 2013 Compuware. All rights reserved.
//


#import <Foundation/Foundation.h>

//extern static NSBundle* myBundle
// some macros (optional, but makes life easy)

// Use "LocalizedString(key)" the same way you would use "NSLocalizedString(key,comment)"
#define LocalizedString(key) [[LocalizeHelper sharedLocalSystem] localizedStringForKey:(key)]

// "language" can be (for american english): "en", "en-US", "english". Analogous for other languages.
#define LocalizationSetLanguage(language) [[LocalizeHelper sharedLocalSystem] setLanguage:(language)]

@interface LocalizeHelper : NSObject

// a singleton:
+ (LocalizeHelper*) sharedLocalSystem;

// this gets the string localized:
- (NSString*) localizedStringForKey:(NSString*) key;

//set a new language:
- (NSBundle *) setLanguage:(NSString*) lang;
- (UIImage *)setImageFromBundle:(NSBundle *)bundle imageNameIs:(NSString *)imageString;

@end