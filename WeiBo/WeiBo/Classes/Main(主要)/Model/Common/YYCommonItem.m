//
//  YYCommonItem.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYCommonItem.h"

@implementation YYCommonItem
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon
{
    YYCommonItem *item = [[self alloc] init];
    item.title = title;
    item.icon = icon;
    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title
{
    return [self itemWithTitle:title icon:nil];
}
@end
