//
//  YYRepostsResult.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYBaseParam.h"

@interface YYRepostsResult : YYBaseParam
/** 转发数组 */
@property (nonatomic, strong) NSArray *reposts;
/** 转发总数 */
@property (nonatomic, assign) int total_number;
@end
