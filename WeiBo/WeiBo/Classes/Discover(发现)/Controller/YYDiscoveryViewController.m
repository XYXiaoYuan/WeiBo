//
//  YYDiscoveryViewController.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYDiscoveryViewController.h"
#import "YYSearchBar.h"

@interface YYDiscoveryViewController ()

@end

@implementation YYDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.设置搜索框
    [self setupSearchbar];
    
}

- (void)setupSearchbar
{
    YYSearchBar *searchBar = [YYSearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
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
