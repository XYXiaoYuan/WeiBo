//
//  YYEmotionKeyboard.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYEmotionKeyboard.h"
#import "YYEmotionListView.h"
#import "YYEmotionToolbar.h"
#import "MJExtension.h"
#import "YYEmotionTool.h"

@interface YYEmotionKeyboard () <YYEmotionToolbarDelegate>
/** 表情列表 */
@property (nonatomic, weak) YYEmotionListView *listView;
/** 表情工具条 */
@property (nonatomic, weak) YYEmotionToolbar *toollbar;

@end

@implementation YYEmotionKeyboard

+ (instancetype)keyboard
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage yy_imageWithName:@"emoticon_keyboard_background"]];
        
        // 1.添加表情列表
        YYEmotionListView *listView = [[YYEmotionListView alloc] init];
        [self addSubview:listView];
        self.listView = listView;
        
        // 2.添加表情工具条
        YYEmotionToolbar *toollbar = [[YYEmotionToolbar alloc] init];
        toollbar.delegate = self;
        [self addSubview:toollbar];
        self.toollbar = toollbar;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.设置工具条的frame
    self.toollbar.width = self.width;
    self.toollbar.height = 35;
    self.toollbar.y = self.height - self.toollbar.height;
    
    // 2.设置表情列表的frame
    self.listView.width = self.width;
    self.listView.height = self.toollbar.y;
}

#pragma mark - YYEmotionToolbarDelegate
- (void)emotionToolbar:(YYEmotionToolbar *)toolbar didSelectedButton:(YYEmotionType)emotionType
{
    switch (emotionType) {
        case YYEmotionTypeDefault:// 默认
            self.listView.emotions = [YYEmotionTool defaultEmotions];
            break;
            
        case YYEmotionTypeEmoji: // Emoji
            self.listView.emotions = [YYEmotionTool emojiEmotions];
            break;
            
        case YYEmotionTypeLxh: // 浪小花
            self.listView.emotions = [YYEmotionTool lxhEmotions];
            break;
            
        case YYEmotionTypeRecent: // 最近
            self.listView.emotions = [YYEmotionTool recentEmotions];
            break;
    }
}


@end
