//
//  UIBarButtonItem+YYExtension.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/16.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (YYExtension)
+ (UIBarButtonItem *)yy_itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;
@end
