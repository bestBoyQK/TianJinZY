//
//  UIviewTitle.m
//  TianJinZY
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIviewTitle.h"
#import <Masonry.h>
@implementation UIviewTitle

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
    }
    return self;
}

- (void)setViews{
    self.lableTitle = [[UILabel alloc] init];
    [self addSubview:self.lableTitle];
    self.lableTitle.text = @"P V 查询";
    self.lableTitle.font = [UIFont systemFontOfSize:22];
    self.buttonYouce = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [self.buttonYouce setTitle:@"查询" forState:(UIControlStateNormal)];
    [self.buttonYouce setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self addSubview:self.buttonYouce];
    self.buttonZuoce = [UIButton buttonWithType:(UIButtonTypeSystem)];
    [self addSubview:self.buttonZuoce];
    [self.buttonZuoce setTitle:@"返回" forState:(UIControlStateNormal)];
    [self.buttonZuoce setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [self.lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.mas_equalTo(self).offset(24);
        make.height.mas_equalTo(@40);
    }];
    [self.buttonYouce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 40));
        make.centerY.mas_equalTo(self.lableTitle);
        make.right.mas_equalTo(self).offset(-10);
    }];
    [self.buttonZuoce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.buttonYouce);
        make.centerY.mas_equalTo(self.lableTitle);
        make.left.mas_equalTo(self).offset(10);
        
    }];
    //设置横线
    UIView *hx = [[UIView alloc] init];
    [self addSubview:hx];
    hx.backgroundColor = [UIColor blackColor];
    [hx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.right.bottom.equalTo(self);
        
    }];

    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
