//
//  SecondViewController.m
//  UITabBarController_HomeWork
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "SecondViewController.h"
#import "Photos.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self createScrollView];
    
    
}


- (void)createScrollView{

    Photos *photo = [[Photos alloc]initWithFrame:CGRectMake(0, 0,400,300) images:@[@"d1.jpg", @"d2.jpg", @"d3.jpg"]];
    
    photo.center = self.view.center;

    [self.view addSubview:photo];
    [photo release];



}


















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
