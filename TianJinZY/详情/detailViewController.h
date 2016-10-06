//
//  detailViewController.h
//  TianJinZY
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#warning 当是管理员的时候页面才可以操作:那么就可以设置一个透明的view遮盖住

#import <UIKit/UIKit.h>
#import "detail.h"
#import "QkModel.h"
//两种向前传值的方式:1.block,2.delegate;
//block
typedef void(^sendMessageBlock)(QkModel *modelF);
//代理
@protocol sendDeledge <NSObject>
- (void)sendMessageDelegate:(QkModel *)modelF;


@end


@interface detailViewController : UIViewController

@property(strong,nonatomic)detail *detailV;//页面布局
@property(strong,nonatomic)QkModel *model;
//代理属性
//@property(weak,nonatomic)id<sendDeledge>delegate;
//block
@property(copy,nonatomic)sendMessageBlock block;

- (void)sendMessage:(sendMessageBlock )block;

//用于判断用户的登录状态
@property (nonatomic,strong)NSString *userName;
@property (nonatomic,strong)NSString *passWord;


@end
