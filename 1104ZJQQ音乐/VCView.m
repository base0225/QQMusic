//
//  VCView.m
//  07-定时器,雪花
//
//  Created by xiaomage on 15/9/23.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "VCView.h"

@implementation VCView



-(void)awakeFromNib{
    
    //添加一个定时器
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    
    
    //在绘图当中, 我们一般使用CADisplayLink.因为他和setNeedsDisplay调用时机是一样的,都是当下一次屏幕刷新的时候调用.
    //CADisplayLink
    //它是当每次屏幕刷新的时候就会调用定时器方法.(每一秒种刷新60次)
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    //想让定时器工作,必须得要把它添加到主运行循环.
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
  
}


//static int _snowY = 0;

//定时器的方法
- (void)update{

    //每次修改绘制的Y.
//    _snowY += 10;
//
//    //如果超过屏幕高度, 让它从0开始
//    if(_snowY > [UIScreen mainScreen].bounds.size.height){
//        _snowY = 0;
//    }
    //重绘
    //setNeedsDisplay底层会调用drawRect,它并不是立马调用的.它仅仅是设了一个标志,当下一次屏幕刷新的才会去调用.
    [self setNeedsDisplay];
    
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    //加载雪花
//    UIImage *image = [UIImage imageNamed:@"雪花"];
//    //绘制雪花
//    [image drawAtPoint:CGPointMake(0, _snowY)];
//    
    UIImageView *peach2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"雪花"]];//声明一个UIImageView对象，用来添加图片
    peach2.alpha = 0.8;//设置该view的alpha为0.5，半透明的
    int xx = round(random()%2000);//随机得到该图片的x坐标
    int yx = round(random()%2000);//这个是该图片移动的最后坐标x轴的
    int sx = random()%50+3;//这个是定义雪花图片的大小
    int spx = random()%2;//这个是速度
    peach2.frame = CGRectMake(xx, -30, sx, sx);//雪花开始的大小和位置
    
    [self addSubview:peach2];
//    [view_bottom addSubview:peach2];//添加该view
    [UIView animateWithDuration:20*spx
                     animations:^{
                         peach2.frame = CGRectMake(yx, self.frame.size.height, 0, 0);//设定该雪花最后的消失坐标
                     } completion:^(BOOL finished) {
//                         peach2.frame = CGRectMake(375, 667, 0, 0);
                         [peach2 removeFromSuperview];
                     }];
}


@end
