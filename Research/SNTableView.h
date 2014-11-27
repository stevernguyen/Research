//
//  SNTableView.h
//  Research
//
//  Created by tvo on 11/27/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SNTableView : UITableView

/**
 *  height header has setup. Default 40
 */
@property (nonatomic, assign) CGFloat heightHeader;

/**
 *  disable/enable float header. Default NO: enable float header
 */
@property (nonatomic, assign) BOOL disableFloatHeader;

/**
 *  require if disable float header
 *
 *  @param scrollView
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;

/**
 *  cancel scrolling
 */
- (void)cancelScrolling;

@end
