//
//  ZJMusicOperationTool.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJMusicOperationTool.h"
#import "ZJAudioTool.h"
#import "ZJMusicModel.h"

@interface ZJMusicOperationTool ()

@property (nonatomic,strong) ZJAudioTool *audioTool;

@property (nonatomic,assign) NSInteger currentIndex;

@end

@implementation ZJMusicOperationTool

single_implementation(ZJMusicOperationTool)

- (ZJAudioTool *)audioTool
{
    if (_audioTool == nil) {
        
        _audioTool = [[ZJAudioTool alloc] init];
        
    }
    return _audioTool;
}

//重写set方法，进行数据过滤
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    if (_currentIndex < 0 ) {
        currentIndex = self.musicMs.count - 1;
    }
    
    if (_currentIndex >= self.musicMs.count) {
        
        currentIndex = 0;
    }
    
    _currentIndex = currentIndex;
    
}

//开始播放音乐
- (void)playMusic:(ZJMusicModel *)model
{
    [self.audioTool playAutoWith:model.filename];
    
    //获取当前歌的角标
    _currentIndex = [[self.musicMs valueForKeyPath:@"filename"] indexOfObject:model.filename];
    
    // 这一行代码什么意思？
    _currentIndex = [self.musicMs indexOfObject:model];
}

//暂停播放音乐
- (void)pauseMusic:(ZJMusicModel*)model
{
    [self.audioTool pauseAutoWith:model.filename];
}

//停止播放音乐
- (void)stopMusic:(ZJMusicModel *)model
{
    [self.audioTool stopAutoWith:model.filename];
}

//停止播放当前的音乐
- (void)stopCurrentMusic
{
    ZJMusicModel *musicM = self.musicMs[_currentIndex];
    
    [self stopMusic:musicM];
}

//暂定当前音乐
- (void)pauseCurrentMusic
{
    ZJMusicModel *musicM = self.musicMs[_currentIndex];
    
    [self pauseMusic:musicM];
}

//开始播放音乐
- (void)playCurrentMusic
{
    ZJMusicModel *musicM = self.musicMs[_currentIndex];
    
    [self playMusic:musicM];
}

//播放下一首音乐
- (void)preMusic
{
    //先暂停当前音乐
    [self stopCurrentMusic];
    
    //开始播放上一个音乐
    ZJMusicModel *musicM = self.musicMs[++self.currentIndex];
    [self playMusic:musicM];
}

//播放上一首音乐
- (void)nextMusic
{
    //先暂停当前音乐
    [self stopCurrentMusic];
    
    //开始播放上一个音乐
    ZJMusicModel *musicM = self.musicMs[--self.currentIndex];
    [self playMusic:musicM];

}

@end
