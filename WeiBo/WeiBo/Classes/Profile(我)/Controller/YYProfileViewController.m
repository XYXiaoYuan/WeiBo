//
//  YYProfileViewController.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYProfileViewController.h"
#import "YYSettingViewController.h"

@interface YYProfileViewController ()

@end

@implementation YYProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化模型数据
    [self setupGroups];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:@selector(setting)];
}

- (void)setting
{
    YYSettingViewController *setting = [[YYSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

/**
 *  初始化模型数据
 */
- (void)setupGroups
{
    [self setupGroup0];
    [self setupGroup1];
}

- (void)setupGroup0
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonArrowItem *newFriend = [YYCommonArrowItem itemWithTitle:@"新的好友" icon:@"new_friend"];
    newFriend.badgeValue = @"5";
    
    group.items = @[newFriend];
}

- (void)setupGroup1
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonArrowItem *album = [YYCommonArrowItem itemWithTitle:@"我的相册" icon:@"album"];
    album.subtitle = @"(100)";
    
    YYCommonArrowItem *collect = [YYCommonArrowItem itemWithTitle:@"我的收藏" icon:@"collect"];
    collect.subtitle = @"(10)";
    collect.badgeValue = @"1";
    
    YYCommonArrowItem *like = [YYCommonArrowItem itemWithTitle:@"赞" icon:@"like"];
    like.subtitle = @"(36)";
    like.badgeValue = @"10";
    
    group.items = @[album, collect, like];
}
@end
