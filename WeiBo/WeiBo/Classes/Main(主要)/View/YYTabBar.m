//
//  YYTabBar.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYTabBar.h"

@interface YYTabBar ()
@property (nonatomic, weak) UIButton *plusButton;
@end

@implementation YYTabBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) {
            self.backgroundImage = [UIImage yy_imageWithName:@"tabbar_background"];
        }
        self.selectionIndicatorImage = [UIImage yy_imageWithName:@"navigationbar_button_background"];
        
        // 添加加号按钮
        [self setupPlusButton];
    }
    return self;
}

#pragma mark - 添加加号按钮
- (void)setupPlusButton
{
    UIButton *plusButton = [[UIButton alloc] init];
    
    // 设置背景
    [plusButton setBackgroundImage:[UIImage yy_imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage yy_imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 设置图标
    [plusButton setImage:[UIImage yy_imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage yy_imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusButton addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    
    // 添加
    [self addSubview:plusButton];
    self.plusButton = plusButton;
}

- (void)plusClick
{
    if (self.tabBarPlusClickBlock) {
        self.tabBarPlusClickBlock();
    }
}

/** 布局子控件 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置plusButton的frame
    [self setupPlusButtonFrame];
    
    // 设置所有tabbarButton的frame
    [self setupAllTabBarButtonsFrame];
}

/** 设置所有plusButton的frame */
- (void)setupPlusButtonFrame
{
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    self.plusButton.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

/** 设置所有tabbarButton的frame */
- (void)setupAllTabBarButtonsFrame
{
    int index = 0;
    
    // 遍历所有的button
    for (UIView *tabBarButton in self.subviews) {
        // 如果不是UITabBarButton， 直接跳过
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        // 根据索引调整位置
        [self setupTabBarButtonFrame:tabBarButton atIndex:index];
        
        // 索引增加
        index++;
    }
}

/**
 *  设置某个按钮的frame
 *
 *  @param tabBarButton 需要设置的按钮
 *  @param index        按钮所在的索引
 */
- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    // 计算button的尺寸
    CGFloat buttonW = self.width / (self.items.count + 1);
    CGFloat buttonH = self.height;
    
    tabBarButton.width = buttonW;
    tabBarButton.height = buttonH;
    if (index >= 2) {
        tabBarButton.x = buttonW * (index + 1);
    } else {
        tabBarButton.x = buttonW * index;
    }
    tabBarButton.y = 0;
}


@end
