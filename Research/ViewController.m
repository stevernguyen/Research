//
//  ViewController.m
//  Research
//
//  Created by tvo on 11/18/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "ViewController.h"

#define kHeight 50

@interface ViewController ()
{
    UIView *mainView;
    UIView *contentView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mainView = [[UIView alloc] initWithFrame:CGRectZero];
    mainView.backgroundColor = [UIColor brownColor];
    mainView.userInteractionEnabled = YES;
    [self.view addSubview:mainView];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [mainView addGestureRecognizer:pan];
    
    contentView = [[UIView alloc] initWithFrame:CGRectZero];
    contentView.backgroundColor = [UIColor darkGrayColor];
    [mainView addSubview:contentView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    mainView.frame = CGRectMake(0, self.view.frame.size.height - kHeight, self.view.frame.size.width, self.view.frame.size.height + kHeight);
    contentView.frame = CGRectMake(0, kHeight, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)panGesture:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        gesture.view.alpha = 0.8f;
    } else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translate = [gesture translationInView:gesture.view];
        CGRect f = gesture.view.frame;
        f.origin.x = 0;
        f.origin.y = f.origin.y + translate.y;
        
        if (f.origin.y < -kHeight) {
            f.origin.y = -kHeight;
        }
        
        if (f.origin.y > self.view.frame.size.height - kHeight) {
            f.origin.y = self.view.frame.size.height - kHeight;
        }
        
        gesture.view.frame = f;
        [gesture setTranslation:CGPointZero inView:gesture.view];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded ||
               gesture.state == UIGestureRecognizerStateFailed ||
               gesture.state == UIGestureRecognizerStateCancelled)
    {
        CGRect f = gesture.view.frame;
        if (f.origin.y < self.view.frame.size.height / 2) {
            f.origin.y = -kHeight;
        }
        
        if (f.origin.y >= self.view.frame.size.height / 2) {
            f.origin.y = self.view.frame.size.height - kHeight;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            gesture.view.frame = f;
        } completion:^(BOOL finished) {
            gesture.view.alpha = 1.f;
        }];
    }
}


@end
