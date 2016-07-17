//
//  YYEmotionTool.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  管理表情数据：加载表情数据、存储表情使用记录

#import <Foundation/Foundation.h>

@class YYEmotion;
@interface YYEmotionTool : NSObject
/**
 *  默认表情
 */
+ (NSArray *)defaultEmotions;
/**
 *  emoji表情
 */
+ (NSArray *)emojiEmotions;
/**
 *  浪小花表情
 */
+ (NSArray *)lxhEmotions;
/**
 *  最近表情
 */
+ (NSArray *)recentEmotions;

/**
 *  根据表情的文字描述找出对应的表情对象
 */
+ (YYEmotion *)emotionWithDesc:(NSString *)desc;

/**
 *  保存最近使用的表情
 */
+ (void)addRecentEmotion:(YYEmotion *)emotion;
@end
