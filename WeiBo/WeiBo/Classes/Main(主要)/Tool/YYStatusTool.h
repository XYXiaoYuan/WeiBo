//
//  YYStatusTool.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//  微博业务类：处理跟微博相关的一切业务，比如加载微博数据、发微博、删微博

#import "YYBaseTool.h"
//#import "YYHomeStatusesParam.h"
//#import "YYHomeStatusesResult.h"
#import "YYSendStatusParam.h"
#import "YYSendStatusResult.h"
//#import "YYCommentsParam.h"
//#import "YYCommentsResult.h"
#import "YYRepostsParam.h"
#import "YYRepostsResult.h"

@interface YYStatusTool : YYBaseTool
/**
 *  加载首页的微博数据
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
//+ (void)homeStatusesWithParam:(YYHomeStatusesParam *)param success:(void (^)(YYHomeStatusesResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  发没有图片的微博
 *
 *  @param param   请求参数
 *  @param success 请求成功后的回调（请将请求成功后想做的事情写到这个block中）
 *  @param failure 请求失败后的回调（请将请求失败后想做的事情写到这个block中）
 */
+ (void)sendStatusWithParam:(YYSendStatusParam *)param success:(void (^)(YYSendStatusResult *result))success failure:(void (^)(NSError *error))failure;

/**
 *  加载评论数据
 */
//+ (void)commentsWithParam:(YYCommentsParam *)param success:(void (^)(YYCommentsResult *result))success failure:(void (^)(NSError *error))failure;
/**
 *  加载转发数据
 */
+ (void)repostsWithParam:(YYRepostsParam *)param success:(void (^)(YYRepostsResult *result))success failure:(void (^)(NSError *error))failure;
@end
