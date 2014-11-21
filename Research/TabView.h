//
//  TabView.h
//  Research
//
//  Created by tvo on 11/21/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TabViewType) {
    TabViewType1,
    TabViewType2,
    TabViewType3
};

typedef NS_ENUM(NSUInteger, TabViewSelect) {
    TabViewSelectHome,
    TabViewSelectTab1,
    TabViewSelectTab2,
    TabViewSelectTab3
};

@class TabView;
@protocol TabViewDelegate <NSObject>
- (void)tabview:(TabView*)tab didSelectIndex:(TabViewSelect)index;
@end

@interface TabView : UIView

@property (nonatomic, weak) id<TabViewDelegate> delegate;

@property (nonatomic, assign) TabViewType type;

@end
