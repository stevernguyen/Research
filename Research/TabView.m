//
//  TabView.m
//  Research
//
//  Created by tvo on 11/21/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "TabView.h"

#define kColorActive    [UIColor darkGrayColor]
#define kColorNormal    [UIColor whiteColor]

#define kTextColorActive    [UIColor whiteColor]
#define kTextColorNormal    [UIColor blackColor]

#define kFont       [UIFont systemFontOfSize:15]

#define kImageHomeNormal    [UIImage imageNamed:@"tab-icon-home-hover.png"]
#define kImageHomeActive    [UIImage imageNamed:@"tab-icon-home-hover.png"]

#define kImageType1Tab1Normal    [UIImage imageNamed:@"tab-icon-album.png"]
#define kImageType1Tab1Active    [UIImage imageNamed:@"tab-icon-album-hover.png"]
#define kImageType1Tab2Normal    [UIImage imageNamed:@"tab-icon-quocgia.png"]
#define kImageType1Tab2Active    [UIImage imageNamed:@"tab-icon-quocgia-hover.png"]
#define kImageType1Tab3Normal    [UIImage imageNamed:@"tab-icon-video.png"]
#define kImageType1Tab3Active    [UIImage imageNamed:@"tab-icon-video-hover.png"]

#define kImageType2Tab1Normal    [UIImage imageNamed:@"tab-icon-new.png"]
#define kImageType2Tab1Active    [UIImage imageNamed:@"tab-icon-new-tap-hover.png"]
#define kImageType2Tab2Normal    [UIImage imageNamed:@""]
#define kImageType2Tab2Active    [UIImage imageNamed:@""]
#define kImageType2Tab3Normal    [UIImage imageNamed:@"tab-icon-album.png"]
#define kImageType2Tab3Active    [UIImage imageNamed:@"tab-icon-album-hover.png"]

#define kImageType3Tab1Normal    [UIImage imageNamed:@""]
#define kImageType3Tab1Active    [UIImage imageNamed:@""]
#define kImageType3Tab2Normal    [UIImage imageNamed:@""]
#define kImageType3Tab2Active    [UIImage imageNamed:@""]
#define kImageType3Tab3Normal    [UIImage imageNamed:@""]
#define kImageType3Tab3Active    [UIImage imageNamed:@""]

#define kTitleType1Tab1     @"HOME_ALBUM"
#define kTitleType1Tab2     @"HOME_COUNTRY"
#define kTitleType1Tab3     @"HOME_VIDEO"

#define kTitleType2Tab1     @"CATEGORY_NEW"
#define kTitleType2Tab2     @"CATEGORY_HOT"
#define kTitleType2Tab3     @"CATEGORY_ALBUM"

#define kTitleType3Tab1     @"SEARCH_SONG"
#define kTitleType3Tab2     @"SEARCH_VIDEO"
#define kTitleType3Tab3     @"SEARCH_ALBUM"

@interface TabView ()
{
    UIImage *image1;
    UIImage *image1Active;
    
    UIImage *image2;
    UIImage *image2Active;
    
    UIImage *image3;
    UIImage *image3Active;
    
}

@property (weak, nonatomic) IBOutlet UIView *divView;

@property (weak, nonatomic) IBOutlet UIView *homeView;
@property (weak, nonatomic) IBOutlet UIImageView *homeImageView;

@property (weak, nonatomic) IBOutlet UIView *activeView;
@property (weak, nonatomic) IBOutlet UIView *tab1View;
@property (weak, nonatomic) IBOutlet UIImageView *tab1ImageView;
@property (weak, nonatomic) IBOutlet UILabel *tab1TitleLabel;

@property (weak, nonatomic) IBOutlet UIView *tab2View;
@property (weak, nonatomic) IBOutlet UIImageView *tab2ImageView;
@property (weak, nonatomic) IBOutlet UILabel *tab2TitleLabel;

@property (weak, nonatomic) IBOutlet UIView *tab3View;
@property (weak, nonatomic) IBOutlet UIImageView *tab3ImageView;
@property (weak, nonatomic) IBOutlet UILabel *tab3TitleLabel;

@end

@implementation TabView

#pragma mark - layout
- (void)awakeFromNib
{
    [super awakeFromNib];

    self.backgroundColor            = kColorNormal;
    self.divView.backgroundColor    = kColorActive;
    self.activeView.backgroundColor = kColorActive;
    
    self.tab1ImageView.contentMode  = UIViewContentModeScaleToFill;
    self.tab1TitleLabel.textColor   = kTextColorNormal;
    self.tab1TitleLabel.font        = kFont;

    self.tab2ImageView.contentMode  = UIViewContentModeScaleToFill;
    self.tab2TitleLabel.textColor   = kTextColorNormal;
    self.tab2TitleLabel.font        = kFont;

    self.tab3ImageView.contentMode  = UIViewContentModeScaleToFill;
    self.tab3TitleLabel.textColor   = kTextColorNormal;
    self.tab3TitleLabel.font        = kFont;
    
    [self addTapGuestureToView:self.homeView];
    [self addTapGuestureToView:self.tab1View];
    [self addTapGuestureToView:self.tab2View];
    [self addTapGuestureToView:self.tab3View];
    
    [self addLongpressGuestureToView:self.homeView];
    [self addLongpressGuestureToView:self.tab1View];
    [self addLongpressGuestureToView:self.tab2View];
    [self addLongpressGuestureToView:self.tab3View];
    
    [self setupTab];
}

- (void)setupTab
{
    self.homeImageView.image = kImageHomeNormal;
    
    switch (_type) {
        case TabViewType1:
        {
            image1       = kImageType1Tab1Normal;
            image1Active = kImageType1Tab1Active;

            image2       = kImageType1Tab2Normal;
            image2Active = kImageType1Tab2Active;

            image3       = kImageType1Tab3Normal;
            image3Active = kImageType1Tab3Active;
            
            self.tab1TitleLabel.text = kTitleType1Tab1;
            self.tab2TitleLabel.text = kTitleType1Tab2;
            self.tab3TitleLabel.text = kTitleType1Tab3;
            
            break;
        }
        case TabViewType2:
        {
            image1       = kImageType2Tab1Normal;
            image1Active = kImageType2Tab1Active;
            
            image2       = kImageType2Tab2Normal;
            image2Active = kImageType2Tab2Active;
            
            image3       = kImageType2Tab3Normal;
            image3Active = kImageType2Tab3Active;
            
            self.tab1TitleLabel.text = kTitleType2Tab1;
            self.tab2TitleLabel.text = kTitleType2Tab2;
            self.tab3TitleLabel.text = kTitleType2Tab3;
            
            break;
        }
        case TabViewType3:
        {
            image1       = kImageType3Tab1Normal;
            image1Active = kImageType3Tab1Active;
            
            image2       = kImageType3Tab2Normal;
            image2Active = kImageType3Tab2Active;
            
            image3       = kImageType3Tab3Normal;
            image3Active = kImageType3Tab3Active;
            
            self.tab1TitleLabel.text = kTitleType3Tab1;
            self.tab2TitleLabel.text = kTitleType3Tab2;
            self.tab3TitleLabel.text = kTitleType3Tab3;
            
            break;
        }
    }
    
    self.tab1ImageView.image = image1;
    self.tab2ImageView.image = image2;
    self.tab3ImageView.image = image3;
    
}

#pragma mark - setter/getter
- (void)setType:(TabViewType)type
{
    if (_type != type) {
        _type = type;
        [self setupTab];
    }
}

#pragma mark - private methods
- (void)addTapGuestureToView:(UIView*)view
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapGesture:)];
    tap.numberOfTapsRequired = 1;
    
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tap];
}

- (void)addLongpressGuestureToView:(UIView*)view
{
    UILongPressGestureRecognizer *longpress = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                            action:@selector(longpressGesture:)];
    longpress.minimumPressDuration = 0.3;
    
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:longpress];
}

#pragma mark - public methods

#pragma mark - gesture
- (IBAction)tapGesture:(UITapGestureRecognizer*)sender
{
    if (self.activeView.tag != sender.view.tag) {
        self.activeView.tag = sender.view.tag;
        
        __weak typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.2f animations:^{
            // set frame view active
            self.activeView.frame = sender.view.frame;
            
            // reset state non-active for tab old
            self.tab1TitleLabel.textColor = kTextColorNormal;
            self.tab2TitleLabel.textColor = kTextColorNormal;
            self.tab3TitleLabel.textColor = kTextColorNormal;
            
            self.tab1ImageView.image = image1;
            self.tab2ImageView.image = image2;
            self.tab3ImageView.image = image3;
            
        } completion:^(BOOL finished) {
            // set state active for tab current
            TabViewSelect indexSelect = TabViewSelectHome;
            if ([sender.view isEqual:self.homeView]) {
            }
            else if ([sender.view isEqual:self.tab1View]) {
                indexSelect = TabViewSelectTab1;
                self.tab1TitleLabel.textColor = kTextColorActive;
                self.tab1ImageView.image = image1Active;
            }
            else if ([sender.view isEqual:self.tab2View]) {
                indexSelect = TabViewSelectTab2;
                self.tab2TitleLabel.textColor = kTextColorActive;
                self.tab2ImageView.image = image2Active;
            }
            else if ([sender.view isEqual:self.tab3View]) {
                indexSelect = TabViewSelectTab3;
                self.tab3TitleLabel.textColor = kTextColorActive;
                self.tab3ImageView.image = image3Active;
            }
            
            // send action select tab
            if ([weakSelf.delegate respondsToSelector:@selector(tabview:didSelectIndex:)]) {
                [weakSelf.delegate tabview:weakSelf didSelectIndex:indexSelect];
            }
            
        }];
    }
}

- (IBAction)longpressGesture:(UILongPressGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        // set highlight for view
        if ([sender.view isEqual:self.homeView]) {
            
        }
        else if ([sender.view isEqual:self.tab1View]) {
            self.tab1TitleLabel.textColor = kTextColorActive;
            self.tab1ImageView.image = image1Active;
        }
        else if ([sender.view isEqual:self.tab2View]) {
            self.tab2TitleLabel.textColor = kTextColorActive;
            self.tab2ImageView.image = image2Active;
        }
        else if ([sender.view isEqual:self.tab3View]) {
            self.tab3TitleLabel.textColor = kTextColorActive;
            self.tab3ImageView.image = image3Active;
        }
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
    
    }
    else if (sender.state == UIGestureRecognizerStateCancelled ||
             sender.state == UIGestureRecognizerStateEnded ||
             sender.state == UIGestureRecognizerStateFailed)
    {
        // set normal for view
        if ([sender.view isEqual:self.homeView]) {
            
        }
        else if ([sender.view isEqual:self.tab1View]) {
            self.tab1TitleLabel.textColor = kTextColorNormal;
            self.tab1ImageView.image = image1;
        }
        else if ([sender.view isEqual:self.tab2View]) {
            self.tab2TitleLabel.textColor = kTextColorNormal;
            self.tab2ImageView.image = image2;
        }
        else if ([sender.view isEqual:self.tab3View]) {
            self.tab3TitleLabel.textColor = kTextColorNormal;
            self.tab3ImageView.image = image3;
        }
    }
}

@end
