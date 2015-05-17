//
//  ZJQQList.m
//  1104ZJQQ音乐
//
//  Created by base on 15/09/19.
//  Copyright © 2015年 base. All rights reserved.
//

#import "ZJQQList.h"
#import "ZJMusicDataTool.h"
#import "ZJMusicListCell.h"
#import "ZJAudioTool.h"
#import "ZJMusicOperationTool.h"
@interface ZJQQList () 
@property (nonatomic,strong) NSArray *musicMs;

@property (nonatomic,strong) ZJAudioTool *autoTool;

//@property (nonatomic,strong) ZJMusicOperationTool *tool;


@end

@implementation ZJQQList

- (void)setMusicMs:(NSArray *)musicMs
{
    _musicMs = musicMs;
    
    //刷新表格
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.autoTool = [[ZJAudioTool alloc] init];
    
    [self setUpInit];
    
    [self.tableView reloadData];
    
    [ZJMusicDataTool getMusicData:^(NSArray<ZJMusicModel *> *musicMs) {
        self.musicMs = musicMs;
//        NSLog(@"%@",musicMs);
        //把模型传给对应的工具类
        [ZJMusicOperationTool sharedZJMusicOperationTool].musicMs = musicMs;
        }];
}


- (void)setUpInit
{
    //设置导航栏的标题
    self.navigationController.title = @"音乐列表";
    
    //设置tableView的行高
    self.tableView.rowHeight = 80;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //添加背景图片
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"snowbg"]];
    
    image.alpha = 0.8;
    [self.tableView setBackgroundView:image];
    
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated
{  //  在页面即将展示的时候， 不隐藏导航栏
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.musicMs.count;
}

//返回的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ZJMusicListCell *cell = [ZJMusicListCell cellWithTableView:tableView];
    
    ZJMusicModel *musicMode = self.musicMs[indexPath.row];
    
    cell.musicMode =  musicMode;
    

    return cell;
}

// 当选中的时候调用这个方法,用于留接口
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZJMusicModel *musicMode = self.musicMs[indexPath.row];
    
//    [self.autoTool playAutoWith:musicMode.filename];
    
    //停止当前正在播放的音乐
    [[ZJMusicOperationTool sharedZJMusicOperationTool] stopCurrentMusic];
    
    //开始下一个音乐
    [[ZJMusicOperationTool sharedZJMusicOperationTool] playMusic:musicMode];
    
//    NSLog(@"%@",musicMode.name);
    
    //跳转到详情界面
    [self performSegueWithIdentifier:@"list2detail" sender:nil];

}


@end
