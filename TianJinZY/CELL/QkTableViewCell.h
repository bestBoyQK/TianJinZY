//
//  QkTableViewCell.h
//  TianJinZY
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QkModel.h"

@protocol shanchuDelegata <NSObject>

- (void)shanchuAction:(UITableViewCell *)cell;
- (void)tianjiaAction:(UITableViewCell *)cell;


@end



@interface QkTableViewCell : UITableViewCell
@property(nonatomic,strong)UIImageView *imageV;
@property(nonatomic,strong)UILabel *lableName;//名称
@property(nonatomic,strong)UILabel *lablePv;//pv
@property(nonatomic,strong)UILabel *lablePr;//价格
@property(nonatomic,strong)UIButton *buttonTJ;//添加
@property(nonatomic,strong)UIButton *buttonSC;//删除
@property(nonatomic,strong)UIButton *buttonPVTJ;//PV删除


@property(nonatomic,weak)id<shanchuDelegata> delegata;
//@property(nonatomic,strong)UIButton ;
@property(nonatomic,strong)QkModel *model;


+ (instancetype)qktableview:(UITableView *)tableView;




@end
