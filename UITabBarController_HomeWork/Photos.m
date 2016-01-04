//
//  Photos.m
//  UITabBarController_HomeWork
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "Photos.h"

@interface Photos ()<UIScrollViewDelegate>

@property (nonatomic, retain)UIScrollView *scrooll;
@property (nonatomic, retain)UIPageControl *page;
@property (nonatomic, retain)NSMutableArray * arrOfImages;

@end


@implementation Photos

- (void)dealloc{

    [_scrooll release];
    [_page release];
    [_arrOfImages release];
    [super dealloc];
}

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images{

    self = [super initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height )];
   
    if (self) {
        
        self.arrOfImages = [NSMutableArray arrayWithArray:images];
       
        /*将第一张图片放到图片数组最后*/
       [self.arrOfImages addObject:self.arrOfImages.firstObject];
        /* 将第三张图片放到轮播第一*/
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
    
    self.scrooll.pagingEnabled = YES;
    self.scrooll.bounces = YES;
    
    self.scrooll.contentOffset = CGPointMake(frame.size.width, 0);
    
    
    [self createImageViewsWithFrame:frame];
    [self  CreatePageViewWithFrame:frame];
    
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
    
    
    if (scrollView.contentOffset.x == 0) {
        
        [self.scrooll setContentOffset:CGPointMake(self.frame.size.width * (self.arrOfImages.count - 2), 0)];
    }
    
    if (scrollView.contentOffset.x == self.frame.size.width * (self.arrOfImages.count - 1)) {
        [self.scrooll setContentOffset:CGPointMake(self.frame.size.width * (self.arrOfImages.count - 4), 0)];
    }
    
    
    
}







/** pageController */

- (void)CreatePageViewWithFrame:(CGRect)fram{
    
    self.page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, fram.size.width / 2, 40)];
    self.page.center = CGPointMake(fram.size.width/2, fram.size.height - 20);
    [self addSubview:self.page];
    [_page release];
  
    self.page.backgroundColor = [UIColor clearColor];
    self.page.numberOfPages = self.arrOfImages.count;
    
    [self.page addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
}



- (void)pageAction:(UIPageControl *)page{
    
    
    // 设置 scrollView 的偏移量  contentOffset.x 结构体只能用 结构体
    
    // self.Scroll.contentOffset = CGPointMake(page.currentPage*300, 0);
    
    // 带动画
    
    [self.scrooll setContentOffset:CGPointMake(page.currentPage * 300, 0) animated:YES];
    
}












@end
