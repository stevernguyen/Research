//
//  SongTableViewCell.h
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SongTableViewCell : UITableViewCell

+ (NSString*)reuseIdentifier;
+ (CGFloat)heightRow;

- (void)setData:(id)data;

@end
