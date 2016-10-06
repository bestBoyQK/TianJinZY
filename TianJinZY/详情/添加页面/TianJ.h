//
//  TianJ.h
//  TianJinZY
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIviewTitle.h"
@interface TianJ : UIView
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
