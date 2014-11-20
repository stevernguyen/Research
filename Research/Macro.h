//
//  Macro.h
//  Research
//
//  Created by tvo on 11/20/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#ifndef Research_Macro_h
#define Research_Macro_h
 

static NSString *local;
static NSString *LOCALIZABLE(NSString *key, NSString *tbl) {
    static NSString *keyLocale = @"keyLocale";
    NSUserDefaults *usde = [NSUserDefaults standardUserDefaults]; \
    if ( ![usde objectForKey:keyLocale] ) {
        [usde setObject:@"en" forKey:keyLocale];
        [usde synchronize];
    }
    
    local = [usde objectForKey:keyLocale];
    NSString *path = [[NSBundle mainBundle] pathForResource:local ofType:@"lproj"];
    return NSLocalizedStringFromTableInBundle(key, tbl, [NSBundle bundleWithPath:path], nil);
}


#endif
