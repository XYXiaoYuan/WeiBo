//
//  YYLink.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  一个link对象封装一个链接

#import <Foundation/Foundation.h>

@interface YYLink : NSObject
/** 链接文字 */
@property (nonatomic, copy) NSString *text;
/** 链接的范围 */
@property (nonatomic, assign) NSRange range;
/** 链接的边框 */
@property (nonatomic, strong) NSArray *rects;
@end
