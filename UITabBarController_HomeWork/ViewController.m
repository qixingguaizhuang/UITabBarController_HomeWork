//
//  ViewController.m
//  UITabBarController_HomeWork
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *arrData;

@end

@implementation ViewController

- (void)dealloc{

    [_tableView release];
    [_arrData release];
    [super dealloc];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
 
    [self creatTableView];
    [self handleDate];
    
    
}

- (void)handleDate{


    self.arrData = @[
                     @{@"title":@"曾斌",
                       @"detial":@"下午5:49",
                       @"image":@"10.jpg"},
                     
                     @{@"title":@"高赫",
                       @"detial":@"下午5:49",
                       @"image":@"11.jpg"},
                     
                     @{@"title":@"俞明",
                       @"detial":@"下午5:49",
                       @"image":@"12.jpg"},
                     
                     @{@"title":@"韩克泽",
                       @"detial":@"下午2:49",
                       @"image":@"62.jpg"},
                     
                     @{@"title":@"马星辰",
                       @"detial":@"下午5:49",
                       @"image":@"20.jpg"},
                     
                     @{@"title":@"刘俊泽",
                       @"detial":@"上午5:49",
                       @"image":@"29.jpg"},
                     
                     @{@"title":@"刘帅",
                       @"detial":@"下午5:49",
                       @"image":@"35.jpg"},
                     
                     @{@"title":@"习近平",
                       @"detial":@"下午5:49",
                       @"image":@"37.jpg"},
                     
                     @{@"title":@"斯大林",
                       @"detial":@"下午5:49",
                       @"image":@"38.jpg"},
                     
                     @{@"title":@"卡扎菲",
                       @"detial":@"下午5:49",
                       @"image":@"40.jpg"},
                     
                     @{@"title":@"麦马奇",
                       @"detial":@"下午5:49",
                       @"image":@"44.jpg"},
                     
                     @{@"title":@"比尔盖茨",
                       @"detial":@"下午5:49",
                       @"image":@"45.jpg"},
                     
                     @{@"title":@"李想",
                       @"detial":@"下午5:49",
                       @"image":@"51.jpg"},
                     
                     
                     ].mutableCopy;

}




- (void)creatTableView{

    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    
    
    self.tableView.rowHeight = 80;
 
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrData.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    
    if (cell == nil) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"pool1"] autorelease];
    }
    

    NSDictionary *dicOfArrData = [self.arrData objectAtIndex:indexPath.row];
    
    cell.textLabel.text =[dicOfArrData objectForKey:@"title"];
    cell.detailTextLabel.text = [dicOfArrData objectForKey:@"detial"];
  
    cell.imageView.image = [UIImage imageNamed:[dicOfArrData objectForKey:@"image"]];
    
    cell.imageView.layer.cornerRadius = 40;
    cell.imageView.layer.masksToBounds = YES;
    
    return cell;

}









- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
