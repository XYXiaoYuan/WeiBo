//
//  YYComposeToolbar.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    YYComposeToolbarButtonTypeCamera, // 照相机
    YYComposeToolbarButtonTypePicture, // 相册
    YYComposeToolbarButtonTypeMention, // 提到@
    YYComposeToolbarButtonTypeTrend, // 话题
    YYComposeToolbarButtonTypeEmotion // 表情
} YYComposeToolbarButtonType;

@class YYComposeToolbar;

@protocol YYComposeToolbarDelegate <NSObject>

@optional
- (void)composeTool:(YYComposeToolbar *)toolbar didClickedButton:(YYComposeToolbarButtonType)buttonType;
@end


@interface YYComposeToolbar : UIView

@property (nonatomic, weak) id<YYComposeToolbarDelegate> delegate;

/**
 *  是否要显示表情按钮
 */
@property (nonatomic, assign, getter = isShowEmotionButton) BOOL showEmotionButton;

@end
