//
//  UtilManager.h
//  Research
//
//  Created by tvo on 11/20/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilManager : NSObject

+ (NSString*)local:(NSString*)key;

+ (NSString*)local:(NSString*)key tbl:(NSString*)tbl;

@end
