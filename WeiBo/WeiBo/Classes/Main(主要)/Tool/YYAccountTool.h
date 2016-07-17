//
//  YYAccountTool.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYBaseTool.h"
#import "YYAccessTokenParam.h"

@class YYAccount;

@interface YYAccountTool : YYBaseTool

/**
 *  存储帐号
 */
+ (void)save:(YYAccount *)account;

/**
 *  读取帐号
 */
+ (YYAccount *)account;

/**
 *  获得accesToken
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)accessTokenWithParam:(YYAccessTokenParam *)param success:(void (^)(YYAccount *account))success failure:(void (^)(NSError *error))failure;

@end
