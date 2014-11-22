//
//  CategoryView.m
//  Research
//
//  Created by tvo on 11/22/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "CategoryView.h"
#import "SongTableViewCell.h"
#import "VideoTableViewCell.h"
#import "AlbumTableViewCell.h"
#import "SVPullToRefresh.h"

@interface CategoryView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation CategoryView

#pragma mark - init
- (id)init
{
    if (self = [super init]) {
        [self initBase];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initBase];
    }
    return self;
}

- (void)initBase
{
    // init tableview
    self.tableView = [[UITableView alloc] initWithFrame:self.frame];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefreshWithActionHandler:^{
        if ([weakSelf.delegate respondsToSelector:@selector(categoryViewRefresh:)]) {
            [weakSelf.delegate categoryViewRefresh:weakSelf];
        }
        // prepend data to dataSource, insert cells at top of table view
        [weakSelf.tableView.pullToRefreshView stopAnimating];
    }];
    
    [self.tableView addInfiniteScrollingWithActionHandler:^{
        if ([weakSelf.delegate respondsToSelector:@selector(categoryViewInfinite:)]) {
            [weakSelf.delegate categoryViewInfinite:weakSelf];
        }
        // append data to data source, insert new cells at the end of table view
        [weakSelf.tableView.infiniteScrollingView stopAnimating];
    }];
    
}

- (void)dealloc
{
    self.source = nil;
    self.tableView = nil;
    
}

#pragma mark - public methods
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self.tableView setFrame:frame];
}

- (void)setType:(CTViewType)type
{
    _type = type;
    [self.tableView reloadData];
}

- (void)setSource:(NSArray *)source
{
    _source = source;
    [self.tableView reloadData];
}

#pragma mark - private methods


#pragma mark - TableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.source count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id item = self.source[indexPath.row];
    switch (self.type) {
        case CTViewTypeSong:
        {
            NSString *identifier = [SongTableViewCell reuseIdentifier];
            SongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = NEW_VIEW(SongTableViewCell);
            }
            
            [cell setData:item];
            
            return cell;
        }
        case CTViewTypeVideo:
        {
            NSString *identifier = [VideoTableViewCell reuseIdentifier];
            VideoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = NEW_VIEW(VideoTableViewCell);
            }
            
            [cell setData:item];
            
            return cell;
        }
        case CTViewTypeAlbum:
        {
            NSString *identifier = [AlbumTableViewCell reuseIdentifier];
            AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = NEW_VIEW(AlbumTableViewCell);
            }
            
            [cell setData:item];
            
            return cell;
        }
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (self.type) {
        case CTViewTypeSong:
            return [SongTableViewCell heightRow];
        case CTViewTypeVideo:
            return [VideoTableViewCell heightRow];
        case CTViewTypeAlbum:
            return [AlbumTableViewCell heightRow];
        default:
            return 0;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // play
    switch (self.type) {
        case CTViewTypeSong:
        {
           
        }
        case CTViewTypeVideo:
        {
            
        }
        case CTViewTypeAlbum:
        {
           
        }
    }
}

@end
