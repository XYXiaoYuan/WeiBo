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
    
    // 2.初始化模型数据
    [self setupGroups];
    
}

#pragma mark - 1.设置搜索框
- (void)setupSearchbar
{
    YYSearchBar *searchBar = [YYSearchBar searchBar];
    searchBar.width = 300;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
}

#pragma mark - 2.初始化模型数据
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
    [self setupGroup2];
}


- (void)setupGroup0
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的基本数据
    group.header = @"第0组头部";
    group.footer = @"第0组尾部的详细信息";
    
    // 3.设置组的所有行数据
    YYCommonArrowItem *hotStatus = [YYCommonArrowItem itemWithTitle:@"热门微博" icon:@"hot_status"];
    hotStatus.subtitle = @"笑话，娱乐，神最右都搬到这啦";
   
    
    YYCommonArrowItem *findPeople = [YYCommonArrowItem itemWithTitle:@"找人" icon:@"find_people"];
    findPeople.badgeValue = @"N";
    
    findPeople.subtitle = @"名人、有意思的人尽在这里";
    
    group.items = @[hotStatus, findPeople];
}

- (void)setupGroup1
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonItem *gameCenter = [YYCommonItem itemWithTitle:@"游戏中心" icon:@"game_center"];
    
    
    YYCommonLabelItem *near = [YYCommonLabelItem itemWithTitle:@"周边" icon:@"near"];

    near.text = @"测试文字";
    
    YYCommonSwitchItem *app = [YYCommonSwitchItem itemWithTitle:@"应用" icon:@"app"];
  
    app.badgeValue = @"10";
    
    group.items = @[gameCenter, near, app];
}

- (void)setupGroup2
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonSwitchItem *video = [YYCommonSwitchItem itemWithTitle:@"视频" icon:@"video"];
    video.operation = ^{
        YYLog(@"----点击了视频---");
    };
    
    YYCommonSwitchItem *music = [YYCommonSwitchItem itemWithTitle:@"音乐" icon:@"music"];
    YYCommonItem *movie = [YYCommonItem itemWithTitle:@"电影" icon:@"movie"];
    movie.operation = ^{
        YYLog(@"----点击了电影");
    };
    YYCommonLabelItem *cast = [YYCommonLabelItem itemWithTitle:@"播客" icon:@"cast"];
    cast.operation = ^{
        YYLog(@"----点击了播客");
    };
    cast.badgeValue = @"5";
    cast.subtitle = @"(10)";
    cast.text = @"axxxx";
    YYCommonArrowItem *more = [YYCommonArrowItem itemWithTitle:@"更多" icon:@"more"];
    //    more.badgeValue = @"998";
    
    group.items = @[video, music, movie, cast, more];
}

@end
