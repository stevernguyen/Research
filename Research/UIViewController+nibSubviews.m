//
//  UIViewController+nibSubviews.m
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "UIViewController+nibSubviews.h"

@implementation UIViewController (nibSubviews)

- (UIView *)viewFromNib:(NSString *)nibName
{
    NSArray *xib = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    for (id view in xib) { // have to iterate; index varies
        if ([view isKindOfClass:[UIView class]]) return view;
    }
    return nil;
}

- (UIView *)loadNib:(NSString *)nibName inPlaceholder:(UIView *)placeholder
{
    UIView *nibView = [self viewFromNib:nibName];
    [nibView setFrame:placeholder.frame];
    [self.view insertSubview:nibView aboveSubview:placeholder];
    [placeholder removeFromSuperview];
    return nibView;
}

@end
