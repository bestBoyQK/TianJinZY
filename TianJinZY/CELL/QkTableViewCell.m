//
//  QkTableViewCell.m
//  TianJinZY
//
//  Created by mac on 16/5/4.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "QkTableViewCell.h"
#import <Masonry.h>
static const CGFloat lableH = 30;
static const CGFloat conH = 100;

@implementation QkTableViewCell


+ (instancetype)qktableview:(UITableView *)tableView{
    
    NSString *cellID = @"QkTableViewCell";
    QkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[QkTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:cellID];
        //相当于调用下面这个方法
    }
    
    return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setFrames];//设置位置
        
    }
    return self;
    
}
- (void)setFrames{
    self.imageV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageV];
    self.lableName = [[UILabel alloc] init];
    [self.contentView addSubview:self.lableName];
    self.lablePv = [[UILabel alloc] init];
    [self.contentView addSubview:self.lablePv];
    self.lablePr = [[UILabel alloc] init];
    [self.contentView addSubview:self.lablePr];
//    self.buttonTJ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [self.buttonTJ setTitle:@"添加" forState:(UIControlStateNormal)];
//    [self.contentView addSubview:self.buttonTJ];
    self.buttonSC = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.contentView addSubview:self.buttonSC];
    [self.buttonSC setTitle:@"删除" forState:(UIControlStateNormal)];
    [self.buttonSC addTarget:self action:@selector(shanchu) forControlEvents:(UIControlEventTouchUpInside)];
    self.buttonPVTJ = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.contentView addSubview:self.buttonPVTJ];
    [self.buttonPVTJ setTitle:@"添加" forState:(UIControlStateNormal)];
    [self.buttonPVTJ addTarget:self action:@selector(tianjiaPV) forControlEvents:(UIControlEventTouchUpInside)];
    //
    CGFloat padding = conH - lableH *3 -6;
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.mas_equalTo(self.contentView).offset(3);
        make.width.mas_equalTo(100);
        
    }];
    [self.lableName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageV.mas_right).offset(3);
        make.height.mas_equalTo(lableH);
        make.right.mas_equalTo(self.contentView).offset(-3);
        make.top.mas_equalTo(self.contentView).offset(3);
        
    }];
    [self.lablePr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.lableName);
        make.centerX.equalTo(self.lableName);
        make.top.mas_equalTo(self.lableName.mas_bottom).offset(padding/2);
        
    }];
    [self.lablePv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.lableName);
        make.centerX.equalTo(self.lableName);
        make.top.mas_equalTo(self.lablePr.mas_bottom).offset(padding/2);
        
    }];
    [self.buttonPVTJ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lablePr);
        make.bottom.equalTo(self.lablePr);
        make.width.mas_equalTo(@50);
        make.right.equalTo(self.contentView);
        
    }];
    [self.buttonSC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lablePv);
        make.bottom.equalTo(self.lablePv);
        make.width.mas_equalTo(@50);
        make.right.equalTo(self.contentView);
        
    }];
    
    
    
}

- (void)shanchu {
    [self.delegata shanchuAction:self];
}
- (void)tianjiaPV {
    [self.delegata tianjiaAction:self];
}

//布局子视图
- (void)layoutSubviews{
    [super layoutSubviews];
    self.lableName.text = self.model.name;
    self.lablePr.text = [NSString stringWithFormat:@"价格:%@",self.model.price];
    self.lablePv.text = [NSString stringWithFormat:@"PV:%@",self.model.pv];
    self.imageV.image = self.model.image;
    
   
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
