//
//  MidPlayView.m
//  Research
//
//  Created by tvo on 11/26/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "MidPlayView.h"

#define DELTA_HEIGHT   30
#define PAN_ALPHA      0.8

@interface MidPlayView ()
{
    BOOL    allowMidPan;
    CGFloat pointYTop;
    CGFloat pointYBottom;
}

@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIView *mainPlayView;


@end

@implementation MidPlayView

#pragma mark - init
- (id)initWithFrame:(CGRect)frame coverView:(UIView *)coverView mainPlayView:(UIView *)mainPlayView
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
        self.coverView = coverView;
        self.mainPlayView = mainPlayView;
        self.mainPlayView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *panMid = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMidGesture:)];
        [self addGestureRecognizer:panMid];
        
        UIPanGestureRecognizer *panMain = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panMainGesture:)];
        [self.mainPlayView addGestureRecognizer:panMain];
        
        pointYTop    = -(frame.size.height - DELTA_HEIGHT);
        pointYBottom = frame.origin.y;
        
    }
    return self;
}

#pragma mark -
- (void)panMidGesture:(UIPanGestureRecognizer*)gesture
{
    // gesture.view = self
    if (gesture.state == UIGestureRecognizerStateBegan) {
        allowMidPan             = NO;
        self.alpha              = PAN_ALPHA;
        self.mainPlayView.alpha = PAN_ALPHA;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translate = [gesture translationInView:self];
        CGSize size = [UIScreen mainScreen].bounds.size;
        
        if ( !allowMidPan ) {
            // translate main playview
            CGRect fMain = self.mainPlayView.frame;
            fMain.origin.x = 0;
            fMain.origin.y = fMain.origin.y + translate.y;
            self.mainPlayView.frame = fMain;
            
            if (fMain.origin.y <= size.height - DELTA_HEIGHT) {
                allowMidPan = YES;
            }
            
            // translate mid playview
            if (allowMidPan) {
                CGRect fMid = self.frame;
                fMid.origin.x = (size.width - self.frame.size.width) / 2;
                fMid.origin.y = fMid.origin.y + translate.y;
                self.frame = fMid;
            }
        }
        else {
            CGRect fMid = self.frame;
            fMid.origin.x = (size.width - self.frame.size.width) / 2;
            fMid.origin.y = fMid.origin.y + translate.y;
            self.frame = fMid;
            
            CGRect fMain = self.mainPlayView.frame;
            fMain.origin.x = 0;
            fMain.origin.y = fMid.origin.y + fMid.size.height - DELTA_HEIGHT;
            self.mainPlayView.frame = fMain;

        }
        
        [gesture setTranslation:CGPointZero inView:self];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) {
        
        CGRect fMid = self.frame;
        CGRect fMain = self.mainPlayView.frame;
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        if (fMid.origin.y < size.height / 2) {
            fMid.origin.x = (size.width - self.frame.size.width) / 2;
            fMid.origin.y = pointYTop;
            
            fMain.origin.x = 0;
            fMain.origin.y = 0;
        }
        
        if (fMid.origin.y >= size.height / 2) {
            fMid.origin.x = (size.width - self.frame.size.width) / 2;
            fMid.origin.y = pointYBottom;
            
            fMain.origin.x = 0;
            fMain.origin.y = size.height;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            self.frame              = fMid;
            self.mainPlayView.frame = fMain;
        } completion:^(BOOL finished) {
            self.alpha              = 1.f;
            self.mainPlayView.alpha = 1.f;
        }];
        
    }
}

- (void)panMainGesture:(UIPanGestureRecognizer*)gesture
{
    // gesture.view = self.mainPlayView
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.alpha              = PAN_ALPHA;
        self.mainPlayView.alpha = PAN_ALPHA;
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translate = [gesture translationInView:self.mainPlayView];
        
        // translate main playview
        CGRect fMain = self.mainPlayView.frame;
        fMain.origin.x = 0;
        fMain.origin.y = fMain.origin.y + translate.y;
        self.mainPlayView.frame = fMain;
        
        // translate mid playview
        CGSize size = [UIScreen mainScreen].bounds.size;
        CGRect fMid = self.frame;
        fMid.origin.x = (size.width - self.frame.size.width) / 2;
        fMid.origin.y = fMid.origin.y + translate.y;
        self.frame = fMid;
        
        [gesture setTranslation:CGPointZero inView:self.mainPlayView];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateFailed || gesture.state == UIGestureRecognizerStateCancelled) {
        
        CGRect fMid  = self.frame;
        CGRect fMain = self.mainPlayView.frame;
        
        CGSize size = [UIScreen mainScreen].bounds.size;
        if (fMain.origin.y < size.height / 2) {
            fMid.origin.x = (size.width - self.frame.size.width) / 2;
            fMid.origin.y = pointYTop;
            
            fMain.origin.x = 0;
            fMain.origin.y = 0;
        }
        
        if (fMain.origin.y >= size.height / 2) {
            fMid.origin.x = (size.width - self.frame.size.width) / 2;
            fMid.origin.y = pointYBottom;
            
            fMain.origin.x = 0;
            fMain.origin.y = size.height;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            self.frame              = fMid;
            self.mainPlayView.frame = fMain;
        } completion:^(BOOL finished) {
            self.alpha              = 1.f;
            self.mainPlayView.alpha = 1.f;
        }];
        
    }
}


@end
