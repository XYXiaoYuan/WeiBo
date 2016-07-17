//
//  YYStatusPhotoView.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  一个YYStatusPhotoView代表1张配图

#import <UIKit/UIKit.h>
@class YYPhoto;
@interface YYStatusPhotoView : UIImageView
@property (nonatomic, strong) YYPhoto *photo;
@end
