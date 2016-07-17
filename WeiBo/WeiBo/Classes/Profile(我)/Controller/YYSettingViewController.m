//
//  YYSettingViewController.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYSettingViewController.h"
#import "YYGeneralSettingViewController.h"

@interface YYSettingViewController ()

@end

@implementation YYSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    
    [self setupGroups];
    
    [self setupFooter];
}

- (void)setupFooter
{
    // 1.创建按钮
    UIButton *logout = [[UIButton alloc] init];
    
    // 2.设置属性
    logout.titleLabel.font = [UIFont systemFontOfSize:14];
    [logout setTitle:@"退出当前帐号" forState:UIControlStateNormal];
    [logout setTitleColor:YYColor(255, 10, 10) forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage yy_resizedImage:@"common_card_background"] forState:UIControlStateNormal];
    [logout setBackgroundImage:[UIImage yy_resizedImage:@"common_card_background_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置尺寸(tableFooterView和tableHeaderView的宽度跟tableView的宽度一样)
    logout.height = 35;
    
    self.tableView.tableFooterView = logout;
}

/**
 *  初始化模型数据
 */
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
    group.footer = @"tail部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonArrowItem *newFriend = [YYCommonArrowItem itemWithTitle:@"帐号管理"];
    
    group.items = @[newFriend];
}

- (void)setupGroup1
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonArrowItem *newFriend = [YYCommonArrowItem itemWithTitle:@"主题、背景"];
    
    group.items = @[newFriend];
}

- (void)setupGroup2
{
    // 1.创建组
    YYCommonGroup *group = [YYCommonGroup group];
    group.header = @"头部";
    [self.groups addObject:group];
    
    // 2.设置组的所有行数据
    YYCommonArrowItem *generalSetting = [YYCommonArrowItem itemWithTitle:@"通用设置"];
    generalSetting.destVcClass = [YYGeneralSettingViewController class];
    
    group.items = @[generalSetting];
}


@end
