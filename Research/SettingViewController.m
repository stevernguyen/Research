//
//  SettingViewController.m
//  Research
//
//  Created by tvo on 12/1/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import "SettingViewController.h"

#define LOCALIZABLE(v)  [NSString stringWithFormat:@"%@",v]
#define cellIdentifier  @"cellIdentifier"
#define kHeightRow              40
#define kHeightHeader           30
#define kPadding                10

@interface SettingViewController ()<UIActionSheetDelegate>
{
    NSArray *setting;
    NSArray *info;
}
@end

@implementation SettingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    setting = @[LOCALIZABLE(@"SETTING_LANGUAGE"),
                LOCALIZABLE(@"SETTING_QUANLITY_MP3"),
                LOCALIZABLE(@"SETTING_QUANLITY_VIDEO"),
                LOCALIZABLE(@"SETTING_AUTO_SYNC_MUSIC_OFFLINE"),
                LOCALIZABLE(@"SETTING_TIMER_TURN_OFF_MUSIC"),
                LOCALIZABLE(@"SETTING_DOWNLOAD")];
    
    info = @[LOCALIZABLE(@"SETTING_FEED_BACK"),
             LOCALIZABLE(@"SETTING_INFO_APP")];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (UILabel*)createLabelWithFrame:(CGRect)frame text:(NSString*)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.text = text;
    label.font = [UIFont systemFontOfSize:15];
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return setting.count;
    }
    else {
        return info.count;
    }
}

#define keyLanguage @"keyLanguage"
#define keyQuanlityMP3 @"keyQuanlityMP3"
#define keyQuanlityVideo @"keyQuanlityVideo"
#define keyTimerTurnOffMusic @"kTimerTurnOffMusic"
#define keyDownload @"kDownload"
#define keyAutoSyncMusicOffline @"keyAutoSyncMusicOffline"

#define kTagLanguage             111
#define kTagQuanlityMP3          112
#define kTagQuanlityVideo        113
#define kTagDownload             114
#define kTagAutoSyncMusicOffline 113
#define kTagTimerTurnOffMusic    114
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    for (UIView *subview in cell.contentView.subviews) {
        [subview removeFromSuperview];
    }
    
    UIView *sepatorBottom = [[UIView alloc] initWithFrame:CGRectMake(0, kHeightRow-1, self.view.frame.size.width, 1)];
    sepatorBottom.backgroundColor = [UIColor darkGrayColor];
    [cell.contentView addSubview:sepatorBottom];
    
    NSUserDefaults *usder = [NSUserDefaults standardUserDefaults];
    if (indexPath.section == 0) {
        // add title left
        CGFloat x = kPadding;
        CGFloat y = 10;
        CGFloat h = 24;
        CGRect f = CGRectMake(x, y, self.view.frame.size.width - 100, h);
        UILabel *titleLabel = [self createLabelWithFrame:f text:LOCALIZABLE(@"SETTING_LANGUAGE")];
        [cell.contentView addSubview:titleLabel];
        
        // add title right
        x = titleLabel.frame.origin.x + titleLabel.frame.size.width + kPadding;
        f = CGRectMake(x, y, self.view.frame.size.width - 2 * x, h);
        
        NSString *item = setting[indexPath.row];
        if ([item isEqualToString:LOCALIZABLE(@"SETTING_LANGUAGE")]) {
            UILabel *languageLabel = [self createLabelWithFrame:f text:[usder objectForKey:keyLanguage]];
            languageLabel.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:titleLabel];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_QUANLITY_MP3")]) {
            UILabel *languageLabel = [self createLabelWithFrame:f text:[usder objectForKey:keyQuanlityMP3]];
            languageLabel.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:titleLabel];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_QUANLITY_VIDEO")]) {
            UILabel *languageLabel = [self createLabelWithFrame:f text:[usder objectForKey:keyQuanlityVideo]];
            languageLabel.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:titleLabel];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_AUTO_SYNC_MUSIC_OFFLINE")]) {
            UISwitch *syncMusicSwitch = [[UISwitch alloc] initWithFrame:f];
            syncMusicSwitch.tag = kTagAutoSyncMusicOffline;
            syncMusicSwitch.on = [usder boolForKey:keyAutoSyncMusicOffline];
            [syncMusicSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            syncMusicSwitch.center = CGPointMake(syncMusicSwitch.center.x, kHeightRow/2);
            [cell.contentView addSubview:syncMusicSwitch];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_TIMER_TURN_OFF_MUSIC")]) {
            UISwitch *timerTurnOffMusicSwitch = [[UISwitch alloc] initWithFrame:f];
            timerTurnOffMusicSwitch.tag = kTagTimerTurnOffMusic;
            timerTurnOffMusicSwitch.on = [usder boolForKey:keyTimerTurnOffMusic];
            [timerTurnOffMusicSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
            timerTurnOffMusicSwitch.center = CGPointMake(timerTurnOffMusicSwitch.center.x, kHeightRow/2);
            [cell.contentView addSubview:timerTurnOffMusicSwitch];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_DOWNLOAD")]) {
            UILabel *languageLabel = [self createLabelWithFrame:f text:[usder objectForKey:keyDownload]];
            languageLabel.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:titleLabel];
        }
        
    }
    else if (indexPath.section == 1) {
        CGRect f = CGRectMake(kPadding, 10, self.view.frame.size.width - 100, 24);
        UILabel *titleLabel = [self createLabelWithFrame:f text:LOCALIZABLE(@"SETTING_LANGUAGE")];
        [cell.contentView addSubview:titleLabel];
        
        NSString *item = info[indexPath.row];
        if ([item isEqualToString:LOCALIZABLE(@"SETTING_FEED_BACK")]) {
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_INFO_APP")]) {
            
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeightHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kHeightRow;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *action = nil;
    if (indexPath.section == 0) {
        NSString *item = setting[indexPath.row];
        if ([item isEqualToString:LOCALIZABLE(@"SETTING_LANGUAGE")]) {
            action = [[UIActionSheet alloc] initWithTitle:LOCALIZABLE(@"SELECT_LANGUAGE")
                                                 delegate:self
                                        cancelButtonTitle:LOCALIZABLE(@"CANCEL")
                                   destructiveButtonTitle:nil
                                        otherButtonTitles:LOCALIZABLE(@"VIETNAM"),LOCALIZABLE(@"ENGLISH"), nil];
            action.tag = kTagLanguage;
            [action showInView:[UIApplication sharedApplication].keyWindow];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_QUANLITY_MP3")]) {
            action = [[UIActionSheet alloc] initWithTitle:LOCALIZABLE(@"SELECT_QUANLITY")
                                                 delegate:self
                                        cancelButtonTitle:LOCALIZABLE(@"CANCEL")
                                   destructiveButtonTitle:nil
                                        otherButtonTitles:nil];
            action.tag = kTagQuanlityMP3;
            [action showInView:[UIApplication sharedApplication].keyWindow];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_QUANLITY_VIDEO")]) {
            action = [[UIActionSheet alloc] initWithTitle:LOCALIZABLE(@"SELECT_QUANLITY")
                                                 delegate:self
                                        cancelButtonTitle:LOCALIZABLE(@"CANCEL")
                                   destructiveButtonTitle:nil
                                        otherButtonTitles:nil];
            action.tag = kTagQuanlityVideo;
            [action showInView:[UIApplication sharedApplication].keyWindow];
            
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_DOWNLOAD")]) {
            action = [[UIActionSheet alloc] initWithTitle:LOCALIZABLE(@"SELECT_DOWNLOAD")
                                                 delegate:self
                                        cancelButtonTitle:LOCALIZABLE(@"CANCEL")
                                   destructiveButtonTitle:nil
                                        otherButtonTitles:nil];
            action.tag = kTagDownload;
            [action showInView:[UIApplication sharedApplication].keyWindow];
            
        }
    }
    else if (indexPath.section == 1) {
        NSString *item = info[indexPath.row];
        if ([item isEqualToString:LOCALIZABLE(@"SETTING_FEED_BACK")]) {
            [self sendMail];
        }
        else if ([item isEqualToString:LOCALIZABLE(@"SETTING_INFO_APP")]) {
            
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - private methods
- (void)sendMail
{
    
}

#pragma mark - event
- (void)switchChanged:(UISwitch*)sender
{
    NSUserDefaults *usder = [NSUserDefaults standardUserDefaults];
    if (sender.tag == kTagTimerTurnOffMusic) {
        [usder setBool:sender.isOn forKey:keyTimerTurnOffMusic];
        [usder synchronize];
    }
    else if (sender.tag == kTagAutoSyncMusicOffline) {
        [usder setBool:sender.isOn forKey:keyAutoSyncMusicOffline];
        [usder synchronize];
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (actionSheet.cancelButtonIndex == buttonIndex)
        return;
    
    NSUserDefaults *usder = [NSUserDefaults standardUserDefaults];
    NSString *textSelect = [actionSheet buttonTitleAtIndex:buttonIndex];
    switch (actionSheet.tag) {
        case kTagLanguage:
        {
            [usder setObject:textSelect forKey:keyLanguage];
            break;
        }
        case kTagQuanlityMP3:
        {
            [usder setObject:textSelect forKey:keyQuanlityMP3];
            break;
        }
        case kTagQuanlityVideo:
        {
            [usder setObject:textSelect forKey:keyQuanlityVideo];
            break;
        }
        case kTagDownload:
        {
            [usder setObject:textSelect forKey:keyDownload];
            break;
        }
    }
    
    [usder synchronize];
    [self.tableView reloadData];
}

@end
