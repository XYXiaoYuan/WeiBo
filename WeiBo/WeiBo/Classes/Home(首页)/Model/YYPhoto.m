//
//  YYPhoto.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYPhoto.h"

@implementation YYPhoto
- (void)setThumbnail_pic:(NSString *)thumbnail_pic
{
    _thumbnail_pic = [thumbnail_pic copy];
    
    self.bmiddle_pic = [thumbnail_pic stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
}
@end
