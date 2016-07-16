//
//  UIBarButtonItem+YYExtension.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "UIBarButtonItem+YYExtension.h"

@implementation UIBarButtonItem (YYExtension)
+ (UIBarButtonItem *)yy_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage yy_imageWithName:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage yy_imageWithName:highImageName] forState:UIControlStateHighlighted];
    
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
