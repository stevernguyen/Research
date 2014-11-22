//
//  AlbumTableViewCell.m
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "AlbumTableViewCell.h"

@implementation AlbumTableViewCell

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (CGFloat)heightRow
{
    return 40;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
