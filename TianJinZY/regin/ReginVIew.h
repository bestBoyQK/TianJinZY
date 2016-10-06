//
//  ReginVIew.h
//  TianJinZY
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry.h>
#import "UIviewTitle.h"
#import <AVOSCloud/AVOSCloud.h>
@interface ReginVIew : UIView
@property (strong,nonatomic)UIviewTitle *viewTitle;//自己封装的导航栏
@property (strong,nonatomic)UITextField *textField ;

@property (strong,nonatomic)UITextField *textFieldName;
@property (strong,nonatomic)UITextField *textFieldpassword;




@end
