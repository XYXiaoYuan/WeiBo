//
//  YYComposePhotosView.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YYComposePhotosView : UIView
/**
 *  添加一张图片到相册内部
 *
 *  @param image 新添加的图片
 */
- (void)addImage:(UIImage *)image;

- (NSArray *)images;

@end
