//
//  qkViewController.h
//  TianJinZY
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Qkview.h"
#import "QkTableViewCell.h"
#import "UIviewHeader.h"



@interface qkViewController : UIViewController

@property(nonatomic,strong)Qkview *qkV;
@property(nonatomic,strong)UIviewHeader *viewhead;
//属性传值
@property (strong,nonatomic)UITextField *textFieldN;
@property (strong,nonatomic)UITextField *textFieldP;


//@property (nonatomic,strong)QkTableViewCell *cellV;



@end
