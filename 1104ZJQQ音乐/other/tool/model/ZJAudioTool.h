//
//  ZJAudioTool.h
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
#import <Foundation/Foundation.h>

@interface ZJAudioTool : NSObject

//播放一首歌
- (void)playAutoWith:(NSString *)autoName;


// 暂停歌曲
- (void)pauseAutoWith:(NSString *)autoName;


//停止歌曲
- (void)stopAutoWith:(NSString *)autoName;

@end
