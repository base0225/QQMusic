//
//  ZJMusicDataTool.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJMusicDataTool.h"
#import "MJExtension.h"
@implementation ZJMusicDataTool

+ (void)getMusicData:(void(^)(NSArray <ZJMusicModel *> *musicMs))block
{
    
    NSArray *musicMs = [ZJMusicModel objectArrayWithFilename:@"Musics.plist"];
    
    block(musicMs);
    
}

@end
