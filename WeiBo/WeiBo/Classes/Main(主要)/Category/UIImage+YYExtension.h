//
//  UIImage+YYExtension.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YYExtension)

/**
 *  根据图片名自动加载适配iOS6\7的图片
 */
+ (UIImage *)yy_imageWithName:(NSString *)name;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)yy_resizedImage:(NSString *)name;

@end
