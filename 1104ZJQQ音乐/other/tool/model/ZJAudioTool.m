//
//  ZJAudioTool.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJAudioTool.h"
#import <AVFoundation/AVFoundation.h>

@interface ZJAudioTool ()

//创建一个音乐播放器
@property (nonatomic,strong) AVAudioPlayer *player;

@property (nonatomic,strong) NSMutableDictionary *playDict;

@end

@implementation ZJAudioTool

- (NSMutableDictionary *)playDict
{
    if (_playDict == nil) {
        
        _playDict = [NSMutableDictionary dictionary];
    }
    
    return _playDict;
}

//开始播放某首歌曲
- (void)playAutoWith:(NSString *)autoName
{
    //应该从字典中查找对应的播放器的值
    AVAudioPlayer *player = self.playDict[autoName];
    
    if (player == nil) {
        NSURL *url = [[NSBundle mainBundle] URLForResource:autoName withExtension:nil];
        
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    }
    
    if (player) {
        
        [self.playDict setObject:player forKey:autoName];
    }else
    {
        return;
    } 
    //准备播放
    [player prepareToPlay];
    
    //开始播放
    [player play];
}

//  暂停播放歌曲
- (void)pauseAutoWith:(NSString *)autoName
{
    AVAudioPlayer *player = self.playDict[autoName];
    [player pause];
}

// 停止播放歌曲
- (void)stopAutoWith:(NSString *)autoName
{
    AVAudioPlayer *player = self.playDict[autoName];
    [player stop];
    
    //将该字典对应的播放器移除
    [self.playDict removeObjectForKey:autoName];
}
@end
