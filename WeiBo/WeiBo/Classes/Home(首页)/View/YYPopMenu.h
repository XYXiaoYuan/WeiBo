//
//  YYPopMenu.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YYPopMenuArrowPositionCenter = 0,
    YYPopMenuArrowPositionLeft = 1,
    YYPopMenuArrowPositionRight = 2
} YYPopMenuArrowPosition;


@interface YYPopMenu : UIView
/** 点击popMenu做的事情 */
@property(nonatomic,copy) void (^popMenuDidDismissed)();

@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;

@property (nonatomic, assign) YYPopMenuArrowPosition arrowPosition;

/**
 *  初始化方法
 */
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)popMenuWithContentView:(UIView *)contentView;

/**
 *  设置菜单的背景图片
 */
- (void)setBackground:(UIImage *)background;

/**
 *  显示菜单
 */
- (void)showInRect:(CGRect)rect;

/**
 *  关闭菜单
 */
- (void)dismiss;


@end
