//
//  YYStatusPhotosView.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYStatusPhotosView.h"
#import "YYStatusPhotoView.h"
#import "UIImageView+WebCache.h"
#import "YYPhoto.h"

#import "MJPhotoBrowser.h"
#import "MJPhoto.h"

#define YYStatusPhotosMaxCount 9
#define YYStatusPhotosMaxCols(photosCount) ((photosCount==4)?2:3)
#define YYStatusPhotoW 70
#define YYStatusPhotoH YYStatusPhotoW
#define YYStatusPhotoMargin 10

@implementation YYStatusPhotosView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 预先创建9个图片控件
        for (int i = 0; i<YYStatusPhotosMaxCount; i++) {
            YYStatusPhotoView *photoView = [[YYStatusPhotoView alloc] init];
            photoView.tag = i;
            [self addSubview:photoView];
            
            // 添加手势监听器（一个手势监听器 只能 监听对应的一个view）
            UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] init];
            [recognizer addTarget:self action:@selector(tapPhoto:)];
            [photoView addGestureRecognizer:recognizer];
        }
    }
    return self;
}

/**
 *  监听图片的点击
 */
- (void)tapPhoto:(UITapGestureRecognizer *)recognizer
{
    // 1.创建图片浏览器
    MJPhotoBrowser *browser = [[MJPhotoBrowser alloc] init];
    
    // 2.设置图片浏览器显示的所有图片
    NSMutableArray *photos = [NSMutableArray array];
    NSInteger count = self.pic_urls.count;
    for (int i = 0; i<count; i++) {
        YYPhoto *pic = self.pic_urls[i];
        
        MJPhoto *photo = [[MJPhoto alloc] init];
        // 设置图片的路径
        photo.url = [NSURL URLWithString:pic.bmiddle_pic];
        // 设置来源于哪一个UIImageView
        photo.srcImageView = self.subviews[i];
        [photos addObject:photo];
    }
    browser.photos = photos;
    
    // 3.设置默认显示的图片索引
    browser.currentPhotoIndex = recognizer.view.tag;
    
    // 3.显示浏览器
    [browser show];
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    _pic_urls = pic_urls;
    
    for (int i = 0; i<YYStatusPhotosMaxCount; i++) {
        YYStatusPhotoView *photoView = self.subviews[i];
        
        if (i < pic_urls.count) { // 显示图片
            photoView.photo = pic_urls[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSInteger count = self.pic_urls.count;
    int maxCols = YYStatusPhotosMaxCols(count);
    for (int i = 0; i<count; i++) {
        YYStatusPhotoView *photoView = self.subviews[i];
        photoView.width = YYStatusPhotoW;
        photoView.height = YYStatusPhotoH;
        photoView.x = (i % maxCols) * (YYStatusPhotoW + YYStatusPhotoMargin);
        photoView.y = (i / maxCols) * (YYStatusPhotoH + YYStatusPhotoMargin);
    }
}

+ (CGSize)sizeWithPhotosCount:(int)photosCount
{
    int maxCols = YYStatusPhotosMaxCols(photosCount);
    
    // 总列数
    int totalCols = photosCount >= maxCols ?  maxCols : photosCount;
    
    // 总行数
    int totalRows = (photosCount + maxCols - 1) / maxCols;
    
    // 计算尺寸
    CGFloat photosW = totalCols * YYStatusPhotoW + (totalCols - 1) * YYStatusPhotoMargin;
    CGFloat photosH = totalRows * YYStatusPhotoH + (totalRows - 1) * YYStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}

@end
