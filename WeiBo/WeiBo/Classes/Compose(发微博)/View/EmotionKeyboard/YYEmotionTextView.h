//
//  YYEmotionTextView.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYTextView.h"

@class YYEmotion;
@interface YYEmotionTextView : YYTextView
/**
 *  拼接表情到最后面
 */
- (void)appendEmotion:(YYEmotion *)emotion;

/**
 *  具体的文字内容
 */
- (NSString *)realText;
@end
