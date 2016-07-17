//
//  YYUserTool.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYBaseTool.h"
#import "YYUserInfoParam.h"
#import "YYUserInfoResult.h"
#import "YYUnreadCountParam.h"
#import "YYUnreadCountResult.h"
#import "YYBaseTool.h"

@interface YYUserTool : YYBaseTool
/**
 *  加载用户的个人信息
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)userInfoWithParam:(YYUserInfoParam *)param success:(void (^)(YYUserInfoResult *result))success failure:(void (^)(NSError *error))failure;

+ (void)unreadCountWithParam:(YYUnreadCountParam *)param success:(void (^)(YYUnreadCountResult *result))success failure:(void (^)(NSError *error))failure;
@end
