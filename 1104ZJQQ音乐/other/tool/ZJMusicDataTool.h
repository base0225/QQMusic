//
//  ZJMusicDataTool.h
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZJMusicModel.h"
@interface ZJMusicDataTool : NSObject

+ (void)getMusicData:(void(^)(NSArray <ZJMusicModel *> *musicMs))block;

@end
