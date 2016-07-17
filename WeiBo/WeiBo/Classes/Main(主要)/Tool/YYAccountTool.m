//
//  YYAccountTool.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#define YYAccountFilepath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]


#import "YYAccountTool.h"
#import "YYAccount.h"

@implementation YYAccountTool

+ (void)save:(YYAccount *)account
{
    // 归档
    [NSKeyedArchiver archiveRootObject:account toFile:YYAccountFilepath];
}

+ (YYAccount *)account
{
    // 读取帐号
    YYAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:YYAccountFilepath];
    
    // 判断帐号是否已经过期
    NSDate *now = [NSDate date];
    
    if ([now compare:account.expires_time] != NSOrderedAscending) { // 过期
        account = nil;
    }
    return account;
}

+ (void)accessTokenWithParam:(YYAccessTokenParam *)param success:(void (^)(YYAccount *))success failure:(void (^)(NSError *))failure
{
    [self postWithUrl:@"https://api.weibo.com/oauth2/access_token" param:param resultClass:[YYAccount class] success:success failure:failure];
}


@end
