//
//  YYRepostsResult.m
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYRepostsResult.h"
#import "MJExtension.h"
#import "YYStatus.h"

@implementation YYRepostsResult

- (NSDictionary *)mj_objectClassInArray
{
    return @{@"reposts" : [YYStatus class]};
}
@end
