//
//  Qkview.h
//  TianJinZY
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIviewTitle.h"
#import "UIViewPVPrice.h"
@interface Qkview : UIView

@property(nonatomic,strong)UIviewTitle *viewTitle;
@property (nonatomic,strong)UIViewPVPrice *viewPVPrice;

@property(nonatomic,strong)UITableView *tableVW;


- (void)ChaXunSelect;


@end
