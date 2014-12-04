//
//  CSNOldManage.h
//  Research
//
//  Created by tvo on 12/4/14.
//  Copyright (c) 2014 tvo. All rights reserved.
//

#import <Foundation/Foundation.h>

// playlist offline
#define PPlaylist_ID               = @"ID"
#define PPlaylist_name             = @"name"
#define PPlaylist_listSong         = @"listSong"
#define PPlaylist_thumbnailURL     = @"thumbnailURL"
#define PPlaylist_createDate       = @"createDate"
#define PPlaylist_totalSong        = @"totalSong"
#define PPlaylist_pIndex           = @"pIndex"

// song in playlist offline
#define PSong_ID                   = @"ID"
#define PSong_music_id             = @"music_id"
#define PSong_music_title          = @"music_title"
#define PSong_music_artist         = @"music_artist"
#define PSong_music_title_url      = @"music_title_url"
#define PSong_music_time           = @"music_time"
#define PSong_music_bitrate        = @"music_bitrate"
#define PSong_music_length         = @"music_length"
#define PSong_file_32_url          = @"file_32_url"
#define PSong_file_url             = @"file_url"
#define PSong_file_320_url         = @"file_320_url"
#define PSong_file_m4a_url         = @"file_m4a_url"
#define PSong_file_lossless_url    = @"file_lossless_url"
#define PSong_full_url             = @"full_url"
#define PSong_music_width          = @"music_width"
#define PSong_music_height         = @"music_height"
#define PSong_video_thumbnail      = @"video_thumbnail"
#define PSong_music_index          = @"music_index"
#define PSong_music_type           = @"music_type"
#define PSong_music_year           = @"music_year"

// playlist online
#define Playlist_ID                = @"ID"
#define Playlist_music_id          = @"music_id"
#define Playlist_music_title       = @"music_title"
#define Playlist_music_artist      = @"music_artist"
#define Playlist_music_title_url   = @"music_title_url"
#define Playlist_music_time        = @"music_time"
#define Playlist_music_bitrate     = @"music_bitrate"
#define Playlist_music_length      = @"music_length"
#define Playlist_file_32_url       = @"file_32_url"
#define Playlist_file_url          = @"file_url"
#define Playlist_file_320_url      = @"file_320_url"
#define Playlist_file_m4a_url      = @"file_m4a_url"
#define Playlist_file_lossless_url = @"file_lossless_url"
#define Playlist_full_url          = @"full_url"
#define Playlist_music_width       = @"music_width"
#define Playlist_music_height      = @"music_height"
#define Playlist_video_thumbnail   = @"video_thumbnail"
#define Playlist_music_index       = @"music_index"
#define Playlist_music_type        = @"music_type"
#define Playlist_music_year        = @"music_year"

// music download
#define Download_ID                = @"ID"
#define Download_music_downloaded  = @"music_downloaded"
#define Download_music_type        = @"music_type"
#define Download_music_id          = @"music_id"
#define Download_music_title       = @"music_title"
#define Download_music_artist      = @"music_artist"
#define Download_music_composer    = @"music_composer"
#define Download_music_title_url   = @"music_title_url"
#define Download_music_lyric       = @"music_lyric"
#define Download_music_time        = @"music_time"
#define Download_music_bitrate     = @"music_bitrate"
#define Download_music_length      = @"music_length"
#define Download_music_year        = @"music_year"
#define Download_file_url          = @"file_url"
#define Download_music_width       = @"music_width"
#define Download_music_height      = @"music_height"
#define Download_music_img         = @"music_img"
#define Download_video_thumbnail   = @"video_thumbnail"
#define Download_quanlity          = @"quanlity"
#define Download_music_index       = @"music_index"

@interface CSNOldManage : NSObject

- (NSString*)databasePath;
- (BOOL)isExistDataBase;
- (NSArray*)fetchAllObjectOfEntity:(NSString*)entity;

@end
