//
//  YYStatusPhotosView.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  微博cell里面的相册 -- 里面包含N个YYStatusPhotoView

#import <UIKit/UIKit.h>

@interface YYStatusPhotosView : UIView
/**
 *  图片数据（里面都是YYPhoto模型）
 */
@property (nonatomic, strong) NSArray *pic_urls;

/**
 *  根据图片个数计算相册的最终尺寸
 */
+ (CGSize)sizeWithPhotosCount:(int)photosCount;
@end
