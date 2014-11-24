//
//  UIView+Animations.m
//  Research
//
//  Created by tvo on 11/24/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "UIView+Animations.h"

@implementation UIView (Animations)

- (void)rotateForever
{
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue         = [NSNumber numberWithFloat:0.0f];
    animation.toValue           = [NSNumber numberWithFloat:2*M_PI];
    animation.duration          = 3.0f;
    animation.repeatCount       = HUGE_VAL;
    [self.layer addAnimation:animation forKey:@"MyAnimation"];
}

@end
