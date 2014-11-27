//
//  SNTableView.m
//  Research
//
//  Created by tvo on 11/27/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "SNTableView.h"

@interface SNTableView ()
{
    BOOL stopScrolling;
}
@end

@implementation SNTableView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.isDecelerating && stopScrolling) {
        NSArray *paths = [self indexPathsForVisibleRows];
        [self scrollToRowAtIndexPath:[paths objectAtIndex:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        stopScrolling = NO;
    }
    
    if (self.disableFloatHeader) {
        CGFloat sectionHeaderHeight = self.heightHeader ? 40 : self.heightHeader;
        if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y >= 0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        }
        else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

- (void)cancelScrolling
{
    stopScrolling = YES;
    [self scrollViewDidScroll:self];
}

@end
