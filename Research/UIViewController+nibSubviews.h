//
//  UIViewController+nibSubviews.h
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (nibSubviews)

- (UIView *)viewFromNib:(NSString *)nibName;
- (UIView *)loadNib:(NSString *)nibName inPlaceholder:(UIView *)placeholder;

@end
