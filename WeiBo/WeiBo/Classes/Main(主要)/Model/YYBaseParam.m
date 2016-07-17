//
//  YYBaseParam.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYBaseParam.h"

@implementation YYBaseParam
- (id)init
{
    if (self = [super init]) {
//        self.access_token = [YYAccountTool account].access_token;
    }
    return self;
}

+ (instancetype)param
{
    return [[self alloc] init];
}
@end
