//
//  YYEmotionAttachment.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYEmotionAttachment.h"
#import "YYEmotion.h"
@implementation YYEmotionAttachment

- (void)setEmotion:(YYEmotion *)emotion
{
    _emotion = emotion;
    
    self.image = [UIImage yy_imageWithName:[NSString stringWithFormat:@"%@/%@", emotion.directory, emotion.png]];
}


@end
