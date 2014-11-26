//
//  ViewController.m
//  Research
//
//  Created by tvo on 11/18/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "ViewController.h"
#import "TabView.h"
#import "UIViewController+nibSubviews.h"
#import <CoreTelephony/CoreTelephonyDefines.h>
#import <CoreTelephony/CTCallCenter.h>
#import <CoreTelephony/CTCall.h>
#import "MidPlayView.h"

#define kHeight 50

@interface ViewController ()
{
   // UIView *mainView;
    UIView *contentView;
    UILabel *label;
    TabView *tabview;
    
    CGFloat translateX;
    BOOL flag;
}
@property (weak, nonatomic) IBOutlet TabView *tab;
- (IBAction)buttonClick:(id)sender;

@property (strong, nonatomic)  MidPlayView *midView;
@property (strong, nonatomic)  UIView *mainView;
@property (strong, nonatomic)  UIView *coverView;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect fMain = self.view.bounds;
    fMain.origin.y = fMain.size.height;
    self.mainView = [[UIView alloc] initWithFrame:fMain];
    self.mainView.backgroundColor = [UIColor brownColor];
    
    self.coverView = [[UIView alloc] initWithFrame:CGRectZero];
    
    float w = 70;
    float h = 70;
    float x = (self.view.frame.size.width - w) / 2;
    float y = self.view.frame.size.height - h;
    CGRect f = CGRectMake(x, y, w, h);
    self.midView = [[MidPlayView alloc] initWithFrame:f coverView:self.coverView mainPlayView:self.mainView];
    self.midView.backgroundColor = [UIColor darkGrayColor];
    
    [self.view addSubview:self.midView];
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.coverView];
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    [self.midView addGestureRecognizer:pan];

    
//    mainView.backgroundColor = [UIColor brownColor];
//    mainView.userInteractionEnabled = YES;
//    [self.view addSubview:mainView];
//    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
//    [mainView addGestureRecognizer:pan];
//    
//    contentView = [[UIView alloc] initWithFrame:CGRectZero];
//    contentView.backgroundColor = [UIColor darkGrayColor];
//    [mainView addSubview:contentView];
//    
//    label = [[UILabel alloc] init];
//    label.text = LOCALIZABLE(@"title", @"Local");
//    [mainView addSubview:label];
//    
//    self.tab = [[[NSBundle mainBundle] loadNibNamed:@"TabView" owner:self options:nil] lastObject];
//    [self.view bringSubviewToFront:self.tab];
//    [self.view addSubview:self.tab];
    
//    tabview = [[[NSBundle mainBundle] loadNibNamed:@"TabView" owner:self options:nil] lastObject];
//    tabview.frame = CGRectMake(0, 200, 320, 50);
//    [self.view addSubview:tabview];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
//    mainView.frame = CGRectMake(0, self.view.frame.size.height - kHeight, self.view.frame.size.width, self.view.frame.size.height + kHeight);
//    contentView.frame = CGRectMake(0, kHeight, self.view.frame.size.width, self.view.frame.size.height);
//    
//    label.frame = CGRectMake(10, 10, 250, 20);
  
}

- (void)panGesture:(UIPanGestureRecognizer*)gesture
{
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        flag = NO;
        translateX = 0.f;
        gesture.view.alpha = 0.8f;
    } else if (gesture.state == UIGestureRecognizerStateChanged)
    {
        CGPoint translate = [gesture translationInView:gesture.view];
        translateX += translate.y;
        
        CGRect fMain = self.mainView.frame;
        fMain.origin.x = 0;
        fMain.origin.y += translate.y;
        self.mainView.frame = fMain;
        
        if (fMain.origin.y <= self.view.frame.size.height - kHeight) {
            flag = YES;
        }
        
         NSLog(@"%f",translateX);
        if (flag) {
            CGRect f = gesture.view.frame;
            f.origin.x = (self.view.frame.size.width - gesture.view.frame.size.width) / 2;
            f.origin.y = f.origin.y + translate.y;
            
            if (f.origin.y < -kHeight) {
                f.origin.y = -kHeight;
            }
            
            if (f.origin.y > self.view.frame.size.height - kHeight) {
                f.origin.y = self.view.frame.size.height - kHeight;
            }
            
            gesture.view.frame = f;
        }
        
        [gesture setTranslation:CGPointZero inView:gesture.view];
        
    } else if (gesture.state == UIGestureRecognizerStateEnded ||
               gesture.state == UIGestureRecognizerStateFailed ||
               gesture.state == UIGestureRecognizerStateCancelled)
    {
        CGRect f = gesture.view.frame;
        CGRect fMain = self.mainView.frame;
        
        if (f.origin.y < self.view.frame.size.height / 2) {
            f.origin.y = 0;//-kHeight;
            fMain.origin.y = kHeight;
        }
        
        if (f.origin.y >= self.view.frame.size.height / 2) {
            f.origin.y = self.view.frame.size.height - kHeight;
            fMain.origin.x = 0;
            fMain.origin.y = self.view.frame.size.height;
        }
        
        [UIView animateWithDuration:0.3 animations:^{
            gesture.view.frame = f;
            self.mainView.frame = fMain;
        } completion:^(BOOL finished) {
            gesture.view.alpha = 1.f;
        }];
    }
}


- (IBAction)buttonClick:(id)sender {
    
}
@end
