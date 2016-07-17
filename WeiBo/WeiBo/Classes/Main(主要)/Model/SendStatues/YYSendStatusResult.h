//
//  YYSendStatusResult.h
//  WeiBo
//
//  Created by 袁小荣 on 16/7/17.
//  Copyright © 2016年 bruceyuan. All rights reserved.
//

#import "YYStatus.h"

@interface YYSendStatusResult : YYStatus
/**	true	string	要发布的微博文本内容，必须做URLencode，内容不超过140个汉字。*/
@property (nonatomic, copy) NSString *status;
@end
