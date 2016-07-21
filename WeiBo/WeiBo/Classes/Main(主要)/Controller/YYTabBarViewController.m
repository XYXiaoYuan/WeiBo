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

// 自定义YYTabBar
#import "YYTabBar.h"

// 工具类
#import "YYUserTool.h"
#import "YYAccount.h"
#import "YYAccountTool.h"

@interface YYTabBarViewController ()<UITabBarControllerDelegate>
@property (nonatomic, weak) YYHomeViewController *homeVc;
@property (nonatomic, weak) YYMessageViewController *messageVc;
@property (nonatomic, weak) YYProfileViewController *profileVc;
@property (nonatomic, weak) UIViewController *lastSelectedViewContoller;
@end

@implementation YYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.添加所有的子控制器
    [self addAllChildViewControllers];
    
    // 3.创建自定义tabbar
    [self addCustomTabBar];
    
    self.delegate = self;
    
}

#pragma mark - 1.添加所有的子控制器
- (void)addAllChildViewControllers
{
    // 1.1 首页
    YYHomeViewController *homeVc = [[YYHomeViewController alloc] init];
    self.homeVc = homeVc;
    [self addOneViewController:homeVc image:@"tabbar_home" selectedImage:@"tabbar_home_selected" title:@"首页"];
    
    // 1.2 消息
    YYMessageViewController *messageVc = [[YYMessageViewController alloc] init];
    self.messageVc = messageVc;
    [self addOneViewController:messageVc image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected" title:@"消息"];
    
    // 1.3 发现
    [self addOneViewController:[[YYDiscoveryViewController alloc] init] image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected" title:@"发现"];
    
    // 1.4 我的
    YYProfileViewController *profileVc = [[YYProfileViewController alloc] init];
    self.profileVc = profileVc;
    [self addOneViewController:profileVc image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected" title:@"我的"];
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
+ (void)load
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

#pragma mark - 3.创建自定义tabbar
- (void)addCustomTabBar
{
    // 3.1 创建自定义tabbar
    YYTabBar *customTabBar = [[YYTabBar alloc] init];
    
    // 3.2 用 KVC 更换系统自带的tabbar
    [self setValue:customTabBar forKeyPath:@"tabBar"];
    
    // 3.3 处理加号按钮的点击,写处理点击的逻辑放在block中
    customTabBar.tabBarPlusClickBlock = ^{
        // 弹出发微博控制器
        YYComposeViewController *compose = [[YYComposeViewController alloc] init];
        YYNavigationController *nav = [[YYNavigationController alloc] initWithRootViewController:compose];
        [self presentViewController:nav animated:YES completion:nil];
    };
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UINavigationController *)viewController
{
    UIViewController *vc = [viewController.viewControllers firstObject];
    if ([vc isKindOfClass:[YYHomeViewController class]]) {
        if (self.lastSelectedViewContoller == vc) {
//            [self.homeVc refresh:YES];
        } else {
//            [self.homeVc refresh:NO];
        }
    }
    
    self.lastSelectedViewContoller = vc;
}

- (void)getUnreadCount
{
    // 1.请求参数
    YYUnreadCountParam *param = [YYUnreadCountParam param];
    param.uid = [YYAccountTool account].uid;
    
    // 2.获得未读数
    [YYUserTool unreadCountWithParam:param success:^(YYUnreadCountResult *result) {
        // 显示微博未读数
        if (result.status == 0) {
            self.homeVc.tabBarItem.badgeValue = nil;
        } else {
            self.homeVc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.status];
        }
        
        // 显示消息未读数
        if (result.messageCount == 0) {
            self.messageVc.tabBarItem.badgeValue = nil;
        } else {
            self.messageVc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.messageCount];
        }
        
        // 显示新粉丝数
        if (result.follower == 0) {
            self.profileVc.tabBarItem.badgeValue = nil;
        } else {
            self.profileVc.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", result.follower];
        }
        
        // 在图标上显示所有的未读数
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.totalCount;
        YYLog(@"总未读数--%d", result.totalCount);
    } failure:^(NSError *error) {
        YYLog(@"获得未读数失败---%@", error);
    }];
}


@end
