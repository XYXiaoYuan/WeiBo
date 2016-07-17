//
//  YYEmotionToolbar.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  表情底部的工具条

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
@class YYEmotionToolbar;

typedef enum {
    YYEmotionTypeRecent, // 最近
    YYEmotionTypeDefault, // 默认
    YYEmotionTypeEmoji, // Emoji
    YYEmotionTypeLxh // 浪小花
} YYEmotionType;

@protocol YYEmotionToolbarDelegate <NSObject>

@optional
- (void)emotionToolbar:(YYEmotionToolbar *)toolbar didSelectedButton:(YYEmotionType)emotionType;
@end

@interface YYEmotionToolbar : UIView
@property (nonatomic, weak) id<YYEmotionToolbarDelegate> delegate;
@end

