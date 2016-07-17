//
//  YYUser.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYUser.h"

@implementation YYUser
- (BOOL)isVip
{
    // 是会员
    return self.mbtype > 2;
}
@end
