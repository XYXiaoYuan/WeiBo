//
//  YYStatusPhotoView.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYStatusPhotoView.h"
#import "YYPhoto.h"
#import "UIImageView+WebCache.h"

@interface YYStatusPhotoView()
@property (nonatomic, weak) UIImageView *gifView;
@end

@implementation YYStatusPhotoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        
        // 添加一个gif图标
        UIImage *image = [UIImage yy_imageWithName:@"timeline_image_gif"];
        // 这种情况下创建的UIImageView的尺寸跟图片尺寸一样
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:gifView];
        self.gifView = gifView;
    }
    return self;
}

- (void)setPhoto:(YYPhoto *)photo
{
    _photo = photo;
    
    // 1.下载图片
    [self sd_setImageWithURL:[NSURL URLWithString:photo.thumbnail_pic] placeholderImage:[UIImage yy_imageWithName:@"timeline_image_placeholder"]];
    
    // 2.控制gif图标的显示
    NSString *extension = photo.thumbnail_pic.pathExtension.lowercaseString;
    self.gifView.hidden = ![extension isEqualToString:@"gif"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
}


@end
