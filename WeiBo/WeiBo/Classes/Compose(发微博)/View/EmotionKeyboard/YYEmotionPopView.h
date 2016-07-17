//
//  YYEmotionPopView.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYEmotionView;
@interface YYEmotionPopView : UIView
+ (instancetype)popView;

/**
 *  显示表情弹出控件
 *
 *  @param emotionView 从哪个表情上面弹出
 */
- (void)showFromEmotionView:(YYEmotionView *)fromEmotionView;
- (void)dismiss;
@end
