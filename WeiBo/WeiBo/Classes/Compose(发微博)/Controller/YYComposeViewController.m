//
//  YYComposeViewController.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYComposeViewController.h"

@interface YYComposeViewController ()

@end

@implementation YYComposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条内容
    [self setupNavBar];
}

// 设置导航条内容
- (void)setupNavBar
{
//    NSString *name = [HMAccountTool account].name;
//    if (name) {
//        // 构建文字
//        NSString *prefix = @"发微博";
//        NSString *text = [NSString stringWithFormat:@"%@\n%@", prefix, name];
//        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
//        [string addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15] range:[text rangeOfString:prefix]];
//        [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:[text rangeOfString:name]];
//        
//        // 创建label
//        UILabel *titleLabel = [[UILabel alloc] init];
//        titleLabel.attributedText = string;
//        titleLabel.numberOfLines = 0;
//        titleLabel.textAlignment = NSTextAlignmentCenter;
//        titleLabel.width = 100;
//        titleLabel.height = 44;
//        self.navigationItem.titleView = titleLabel;
//    } else {
        self.navigationItem.title = @"发微博";
//    }
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleBordered target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(send)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

#pragma mark - 私有方法
/**
 *  取消
 */
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 *  发送
 */
- (void)send
{
   
    YYLog(@"发送微博");
}


@end
