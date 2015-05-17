//
//  ZJMusicListCell.h
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZJMusicModel.h"

@interface ZJMusicListCell : UITableViewCell

//定义一个Music数据模型
@property (nonatomic,strong) ZJMusicModel *musicMode;

+ (ZJMusicListCell *)cellWithTableView:(UITableView *)tableView;

@end
