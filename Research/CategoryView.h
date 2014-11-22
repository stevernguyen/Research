//
//  CategoryView.h
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CTViewType) {
    CTViewTypeSong,
    CTViewTypeVideo,
    CTViewTypeAlbum,
};

@class CategoryView;
@protocol CategoryViewDelegate <NSObject>
@optional
- (void)categoryViewRefresh:(CategoryView*)view;
- (void)categoryViewInfinite:(CategoryView*)view;
@end

@interface CategoryView : UIView

@property (nonatomic, weak) id<CategoryViewDelegate> delegate;

@property (nonatomic, assign) CTViewType type;

@property (nonatomic, strong) NSArray *source;

@end
