//
//  YYEmotionPopView.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYEmotionPopView.h"
#import "YYEmotionView.h"

@interface YYEmotionPopView ()
@property (weak, nonatomic) IBOutlet YYEmotionView *emotionView;
@end

@implementation YYEmotionPopView

+ (instancetype)popView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)showFromEmotionView:(YYEmotionView *)fromEmotionView
{
    if (fromEmotionView == nil) return;
    
    // 1.显示表情
    self.emotionView.emotion = fromEmotionView.emotion;
    
    // 2.添加到窗口上
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    [window addSubview:self];
    
    // 3.设置位置
    CGFloat centerX = fromEmotionView.centerX;
    CGFloat centerY = fromEmotionView.centerY - self.height * 0.5;
    CGPoint center = CGPointMake(centerX, centerY);
    self.center = [window convertPoint:center fromView:fromEmotionView.superview];
}

- (void)dismiss
{
    [self removeFromSuperview];
}

/**
 *  当一个控件显示之前会调用一次（如果控件在显示之前没有尺寸，不会调用这个方法）
 *
 *  @param rect 控件的bounds
 */
- (void)drawRect:(CGRect)rect
{
    [[UIImage yy_imageWithName:@"emoticon_keyboard_magnifier"] drawInRect:rect];
}


@end
