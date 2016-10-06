//
//  DataHandle.h
//  TianJinZY
//
//  Created by mac on 16/6/10.
//  Copyright © 2016年 mac. All rights reserved.
//

// 单例传值,存储用户名和密码. 各个页面获取,可以判断登录人员的状态

#import <Foundation/Foundation.h>

@interface DataHandle : NSObject
@property (nonatomic,weak)NSString *userName;
@property (nonatomic,weak)NSString *passWord;


+ (instancetype)shareHandle;


@end
