//
//  Qkview.m
//  TianJinZY
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Qkview.h"

//@interface  : <#superclass#>
//
//@end
@interface Qkview()
@property(nonatomic,assign)BOOL isSelect;//判断查询是否改变

@end

@implementation Qkview

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViews];
    }
    return self;
}
- (void)addViews{
    self.isSelect = NO;
    //导航栏
    self.backgroundColor = [UIColor redColor];
    self.viewTitle = [[UIviewTitle alloc] init];
    [self addSubview:self.viewTitle];
    [self.viewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.bottom.mas_equalTo(self.mas_top).offset(64);
        
    }];
    
    //pv 价格 计算试图
    self.viewPVPrice = [[UIViewPVPrice alloc] init];
    [self addSubview:self.viewPVPrice];
    [self.viewPVPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(@50);
        make.top.mas_equalTo(self).offset(64);
    }];
    self.viewPVPrice.lablePV.text = [NSString stringWithFormat:@"PV:0"];
    self.viewPVPrice.lablePrice.text = [NSString stringWithFormat:@"价格:0"];

    //主页的试图
  
    self.tableVW = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStyleGrouped];//设置类型.否则,不随着cell滑动.
    [self addSubview:self.tableVW];
    [self.tableVW mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self);
        make.right.mas_equalTo(self);
        make.top.mas_equalTo(self.viewTitle.mas_bottom).offset(0);
        make.bottom.equalTo(self);
    }];
    

    
}
- (void)ChaXunSelect{
         [self setNeedsUpdateConstraints];
         [self updateConstraintsIfNeeded];
    if (self.isSelect == NO) {
        self.isSelect = YES;
        [self.viewTitle.buttonYouce setTitle:@"完成" forState:(UIControlStateNormal)];
        [self.tableVW mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.viewTitle.mas_bottom).offset(50);
            [self layoutIfNeeded];
        }];
    }else{
        self.isSelect = NO;
        [self.viewTitle.buttonYouce setTitle:@"查询" forState:(UIControlStateNormal)];
        [self.tableVW mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.viewTitle.mas_bottom).offset(0);
            
            [self layoutIfNeeded];
        }];
    }
    
   
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
