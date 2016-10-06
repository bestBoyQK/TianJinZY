//
//  detail.h
//  TianJinZY
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//
/*
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *price;
@property (nonatomic,copy)NSString *counts;
@property (nonatomic,copy)NSString *pv;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *number;
@property (nonatomic,strong)UIImage *image;
 */
#import <UIKit/UIKit.h>
#import "UIviewTitle.h"
@interface detail : UIView
@property (strong, nonatomic)UIView      *viewMiddle;
@property (strong, nonatomic)UIImageView *imageV;
@property (strong, nonatomic)UITextField *textFieldName;
@property (strong, nonatomic)UITextField *textFieldPrice;
@property (strong, nonatomic)UITextField *textFieldCounts;
@property (strong, nonatomic)UITextField *textFieldPV;
@property (strong, nonatomic)UITextField *textFieldTime;
@property (strong, nonatomic)UITextField *textFieldNumber;

@property (strong, nonatomic)UIviewTitle *viewTitle;//封装好的导航栏试图
//如果这里循环创建,那么,就可以省略上面的这些属性.
@property (strong, nonatomic)UITextField *textField;



@end
