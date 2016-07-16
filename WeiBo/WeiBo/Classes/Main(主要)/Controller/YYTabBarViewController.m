//
//  YYTabBarViewController.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYTabBarViewController.h"
#import "YYNavigationController.h"

// 五大模块控制器
#import "YYHomeViewController.h"
#import "YYMessageViewController.h"
#import "YYComposeViewController.h"
#import "YYDiscoveryViewController.h"
#import "YYProfileViewController.h"

@interface YYTabBarViewController ()

@end

@implementation YYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加所有的子控制器
    [self addAllChildViewControllers];
    
}

#pragma mark - 1.添加所有的子控制器
- (void)addAllChildViewControllers
{
    // 1.1 首页
    [self addOneViewController:[[YYHomeViewController alloc] init] image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"首页"];
    
    // 1.2 消息
    [self addOneViewController:[[YYMessageViewController alloc] init] image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected" title:@"消息"];
    
    // 1.3 发现
    [self addOneViewController:[[YYDiscoveryViewController alloc] init] image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected" title:@"发现"];
    
    // 1.4 我的
    [self addOneViewController:[[YYProfileViewController alloc] init] image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected" title:@"我的"];
}

#pragma mark - 1.1.添加一个子控制器的方法
- (void)addOneViewController:(UIViewController *)childViewController image:(NSString *)imageName selectedImage:(NSString *)selectedImageName title:(NSString *)title
{
    YYNavigationController *nav = [[YYNavigationController alloc] initWithRootViewController:childViewController];
    
    // 1.1.1 设置tabBar文字
    childViewController.title = title;
    
    // 1.1.2 设置正常状态下的图标
    nav.tabBarItem.image = [UIImage yy_imageWithName:imageName];
    
    UIImage *selectedImage = [UIImage yy_imageWithName:selectedImageName];
    if (iOS7) {
        // 声明这张图片用原图(别渲染)
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    // 1.1.3 设置选中状态下的图标
    nav.tabBarItem.selectedImage = selectedImage;
    
    // 1.1.4 添加tabBar为控制器的子控制器
    [self addChildViewController:nav];
}


#pragma mark - 2.设置tabBarItems的文字属性
+ (void)initialize
{
    // 2.1 正常状态下的文字
    NSMutableDictionary *normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    normalAttr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    // 2.2 选中状态下的文字
    NSMutableDictionary *selectedAttr = [NSMutableDictionary dictionary];
    selectedAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    selectedAttr[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    
    // 2.3 统一设置UITabBarItem的文字属性
    UITabBarItem *item = [UITabBarItem appearance];
    // 2.3.1 设置UITabBarItem的正常状态下的文字属性
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    // 2.3.2 设置UITabBarItem的选中状态下的文字属性
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
}



@end
