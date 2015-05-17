//
//  ZJMusicOperationTool.h
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJMusicModel.h"
#import "Singleton.h"

@interface ZJMusicOperationTool : NSObject

single_interface(ZJMusicOperationTool)
@property (nonatomic,strong) NSArray<ZJMusicModel *>*musicMs;

//开始播放音乐
- (void)playMusic:(ZJMusicModel *)model;

//暂停播放音乐
- (void)pauseMusic:(ZJMusicModel*)model;

//停止播放音乐
- (void)stopMusic:(ZJMusicModel *)model;

//停止播放当前的音乐
- (void)stopCurrentMusic;

//暂停播放当前的音乐
- (void)pauseCurrentMusic;

//开始播放音乐
- (void)playCurrentMusic;

//播放上一首音乐
- (void)nextMusic;

//播放下一首音乐
- (void)preMusic;

@end
