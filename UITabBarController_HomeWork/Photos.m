//
//  Photos.m
//  UITabBarController_HomeWork
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Photos.h"
#define ImageCount self.arrOfImages.count

@interface Photos ()<UIScrollViewDelegate>

@property (nonatomic, retain)UIScrollView *scrooll;
@property (nonatomic, retain)UIPageControl *page;
@property (nonatomic, retain)NSMutableArray * arrOfImages;
@property (nonatomic, strong) NSTimer *timer;

@end


@implementation Photos

- (void)dealloc{

    [_scrooll release];
    [_page release];
    [_arrOfImages release];
    [_timer release];
    [super dealloc];
}

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images{

    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height )];
   
    if (self) {
        
        self.arrOfImages = [NSMutableArray arrayWithArray:images];
       
        /* 将第一张图片放到图片数组最后 */
       [self.arrOfImages addObject:self.arrOfImages.firstObject];
        /* 将第三张图片放到轮播第一 */
       [self.arrOfImages insertObject:[self.arrOfImages objectAtIndex:self.arrOfImages.count - 2] atIndex:0];
        
        
        [self createScrollWithFrame:frame];
        
    }
    
    return self;
}



- (void)createScrollWithFrame:(CGRect)frame{


    self.scrooll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    [self addSubview:self.scrooll];
    [_scrooll release];


    /** 滚动页面范围 */
    
    self.scrooll.contentSize =CGSizeMake(frame.size.width * self.arrOfImages.count, frame.size.height);
    
    /** 翻页效果*/
    
    self.scrooll.pagingEnabled = YES;
    self.scrooll.bounces = YES;
    
    self.scrooll.contentOffset = CGPointMake(frame.size.width, 0);
    
    
    [self createImageViewsWithFrame:frame];
    [self  CreatePageViewWithFrame:frame];
    [self setUpTimer];
    self.scrooll.delegate = self;
    
}


- (void)createImageViewsWithFrame:(CGRect)frame {
    
    
    for (int i = 0; i < self.arrOfImages.count; i++) {
        
        /** 在每个小scrollView上面添加一个ImageView. */
        
        NSString *name = self.arrOfImages[i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        imageView.frame = CGRectMake(frame.size.width * i, 0, frame.size.width, frame.size.height);
        [self.scrooll addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        [imageView release];
    }
    
}



/** 轮播 */


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    self.page.currentPage = scrollView.contentOffset.x /400;
    
    if (scrollView.contentOffset.x == 0) {
        
        [self.scrooll setContentOffset:CGPointMake(self.frame.size.width * (self.arrOfImages.count - 2), 0)];
    }
    
    if (scrollView.contentOffset.x == self.frame.size.width * (self.arrOfImages.count - 1)) {
        [self.scrooll setContentOffset:CGPointMake(self.frame.size.width * (self.arrOfImages.count - 4), 0)];
    }
}


//
//// 开始拖拽的时候调用
//
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    [self.timer invalidate];
//
//}


// - (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//        //开启定时器
//         [self addTimer];
//    }
//
//     /***  开启定时器 */
//
// - (void)addTimer{
//    
//         self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
//     }
//
//    /***  关闭定时器*/
//
// - (void)removeTimer{
//     
//[self.timer invalidate];
//     
// }
//
//
//




/** pageController */

- (void)CreatePageViewWithFrame:(CGRect)fram{
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, fram.size.width / 2, 40)];
    self.page.pageIndicatorTintColor = [UIColor redColor];
    self.page.currentPageIndicatorTintColor = [UIColor cyanColor];
    
    self.page.center = CGPointMake(fram.size.width/2, fram.size.height + 20 );
    
    [self addSubview:self.page];
    [_page release];
  
    self.page.backgroundColor = [UIColor clearColor];
    self.page.numberOfPages = self.arrOfImages.count;
    
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
}



- (void)pageAction:(UIPageControl *)page{
    
    // 设置 scrollView 的偏移量  contentOffset.x 结构体只能用 结构体
    
    [self.scrooll setContentOffset:CGPointMake(page.currentPage * 400, 0) animated:YES];
    
}


/* 自动轮播 */

- (void)setUpTimer{
    
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timerchanged) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}


- (void)timerchanged{
    NSInteger page = (self.page.currentPage + 1) % ImageCount;
    self.page.currentPage = page;
    [self pageAction:self.page];
    
}








@end
