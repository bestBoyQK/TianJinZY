//
//  TianJViewController.h
//  TianJinZY
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TianJ.h"
#import "QkModel.h"

//block
typedef void(^sendMessageTianJiaBlock)(QkModel *modelT);
@interface TianJViewController : UIViewController

@property(strong,nonatomic)TianJ *tianJiaV;//封装的添加试图.

@property(copy,nonatomic)sendMessageTianJiaBlock block;

- (void)sendMessage:(sendMessageTianJiaBlock )block;


@end
