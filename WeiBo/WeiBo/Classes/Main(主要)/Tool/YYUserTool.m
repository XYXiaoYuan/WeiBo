//
//  YYUserTool.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYUserTool.h"
#import "MJExtension.h"
#import "YYHttpTool.h"

@implementation YYUserTool

+ (void)userInfoWithParam:(YYUserInfoParam *)param success:(void (^)(YYUserInfoResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://api.weibo.com/2/users/show.json" param:param resultClass:[YYUserInfoResult class] success:success failure:failure];
}

+ (void)unreadCountWithParam:(YYUnreadCountParam *)param success:(void (^)(YYUnreadCountResult *))success failure:(void (^)(NSError *))failure
{
    [self getWithUrl:@"https://rm.api.weibo.com/2/remind/unread_count.json" param:param resultClass:[YYUnreadCountResult class] success:success failure:failure];
}


@end
