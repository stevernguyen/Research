//
//  UtilManager.m
//  Research
//
//  Created by tvo on 11/20/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "UtilManager.h"

@implementation UtilManager

+ (NSString*)local:(NSString*)key
{
    return [UtilManager local:key tbl:@"Local"];
}

+ (NSString*)local:(NSString*)key tbl:(NSString*)tbl
{
    static NSString *keyLocale = @"keyLocale";
    NSUserDefaults *usde = [NSUserDefaults standardUserDefaults]; \
    if ( ![usde objectForKey:keyLocale] ) {
        [usde setObject:@"en" forKey:keyLocale];
        [usde synchronize];
    }
    NSString *local = [usde objectForKey:keyLocale];
    NSString *path = [[NSBundle mainBundle] pathForResource:local ofType:@"lproj"];
    return NSLocalizedStringFromTableInBundle(key, tbl, [NSBundle bundleWithPath:path], nil);
}


@end
