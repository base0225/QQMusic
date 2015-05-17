//
//  ZJQQDetail.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJQQDetail.h"
#import "ZJMusicOperationTool.h"

@interface ZJQQDetail ()<UIScrollViewDelegate>
//歌词背景滚动的图片（1次）
@property (weak, nonatomic) IBOutlet UIScrollView *lrcBackView;

//歌曲专辑图片（1次）
@property (weak, nonatomic) IBOutlet UIImageView *singerIconImg;

//总时长（1次）
@property (weak, nonatomic) IBOutlet UILabel *totalTime;

//歌的名称（1次）
@property (weak, nonatomic) IBOutlet UILabel *songnameLabel;

// 歌手的名称（1次）
@property (weak, nonatomic) IBOutlet UILabel *singerNameLabel;

//歌词显示视图（多次）
@property (weak, nonatomic) IBOutlet UILabel *lrcLabel;

//已经播放了多长时间（多次）
@property (weak, nonatomic) IBOutlet UILabel *costTime;

//进度条（多次）
@property (weak, nonatomic) IBOutlet UISlider *progressSilder;

@property (nonatomic,weak) UITableView *lvcTView;

@end

@implementation ZJQQDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpInit];
}

#pragma mark -- 实现业务逻辑
//上一首歌的实现
- (IBAction)prePlay:(UIButton *)sender {
    
   [[ZJMusicOperationTool sharedZJMusicOperationTool] preMusic];
}
// 暂停歌曲
- (IBAction)pausePlay:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        [[ZJMusicOperationTool sharedZJMusicOperationTool] playCurrentMusic] ;
    }else
    {
    [[ZJMusicOperationTool sharedZJMusicOperationTool] pauseCurrentMusic] ;
    }
}

//播放下一首歌曲
- (IBAction)nexrPlay:(UIButton *)sender {
    
[[ZJMusicOperationTool sharedZJMusicOperationTool] nextMusic];

}

//关闭当前控制器
- (IBAction)close:(id)sender {
    
    //移除当前控制器
[self.navigationController popViewControllerAnimated:YES];
    
}


#pragma mark --- 实现一些私有方法
//将导航栏的状态条隐藏
- (void)setUpInit
{
    self.navigationController.navigationBarHidden = YES;
    
    //1、创建歌词视图
    UITableView *table = [[UITableView alloc] init];
    
    [self.lrcBackView addSubview:table];
    
    //设置代理
    self.lrcBackView.delegate = self;
    
    self.lvcTView = table;

    //设置分页
    self.lrcBackView.pagingEnabled = YES;
    self.lrcBackView.showsHorizontalScrollIndicator = NO;
    
    //设置进度条的背景图片
    [self.progressSilder setThumbImage:[UIImage imageNamed:@"player_slider_playback_thumb"] forState:UIControlStateNormal];

    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    //创建歌词视图（scrollview的宽度）
    self.lvcTView.frame =CGRectMake(self.lrcBackView.bounds.size.width, 0, self.lrcBackView.bounds.size.width, self.lrcBackView.bounds.size.height);
    self.lrcBackView.contentSize = CGSizeMake(self.lrcBackView.bounds.size.width * 2, 0);
    
    //设置背景图片是圆形的
    self.singerIconImg.layer.cornerRadius = self.singerIconImg.bounds.size.width * 0.5;
    // 将多余的东西裁剪掉
    self.singerIconImg.layer.masksToBounds = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark -- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scale = 1 - self.lrcBackView.contentOffset.x / scrollView.bounds.size.width;
    // 歌词背景图片滚过来的时候，需要设置原先的背景图片是透明色的
    self.singerIconImg.alpha = scale;
    
    self.lrcLabel.alpha = scale;
}

#pragma mark -- 更新界面信息
//只需要更新一次
- (void)upDateOnce
{
    self.songnameLabel.text = nil;
    self.singerNameLabel.text = nil;
    self.singerIconImg.image = nil;
    self.totalTime = nil;
    
}

//需要跟新多次
- (void)upData
{
    self.lrcLabel.text = nil;
    self.costTime = nil;
    self.progressSilder = nil;
}

@end
