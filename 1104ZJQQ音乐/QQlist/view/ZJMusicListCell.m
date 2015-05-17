//
//  ZJMusicListCell.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJMusicListCell.h"

@interface ZJMusicListCell ()

@property (weak, nonatomic) IBOutlet UIImageView *singerIMV;
@property (weak, nonatomic) IBOutlet UILabel *SongNML;

@property (weak, nonatomic) IBOutlet UILabel *singerNML;

@end

@implementation ZJMusicListCell


+ (ZJMusicListCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MusicID";
    
    ZJMusicListCell *cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    
    if (cell == nil) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    
    return cell;
}


- (void)setMusicMode:(ZJMusicModel *)musicMode
{
    _musicMode = musicMode;
    
    //歌手的图片
    self.singerIMV.image = [UIImage imageNamed:musicMode.singerIcon];
    
    //歌手的名称
    self.singerNML.text = musicMode.singer;
    
    //歌名
    self.SongNML.text = musicMode.name;
}

- (void)awakeFromNib {

    //将图片设置成圆形的。
    self.singerIMV.layer.cornerRadius = self.singerIMV.bounds.size.width * 0.5;
    self.singerIMV.layer.masksToBounds = YES;

}



@end
