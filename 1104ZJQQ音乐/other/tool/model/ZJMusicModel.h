//
//  ZJMusicModel.h
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJMusicModel : NSObject
//歌曲的名称
@property (nonatomic,copy) NSString *name;
//mp3的名称
@property (nonatomic,copy) NSString *filename;
//歌词的名称
@property (nonatomic,copy) NSString *lrcname;
//歌手的名称
@property (nonatomic,copy) NSString *singer;
//歌手的头像
@property (nonatomic,copy) NSString *singerIcon;
//歌手的图片
@property (nonatomic,copy) NSString *icon;


@end
