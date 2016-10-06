//
//  UIViewPVPrice.m
//  TianJinZY
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIViewPVPrice.h"
#import <Masonry.h>
static const CGFloat h = 40;
static const CGFloat pad = 10;


@implementation UIViewPVPrice

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setViewPVPrive];
    }
    return self;
}
- (void)setViewPVPrive{
    self.lablePrice = [[UILabel alloc] init];
    [self addSubview:self.lablePrice];
    self.lablePV =  [[UILabel alloc] init];
    [self addSubview:self.lablePV];
    [self.lablePV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
        make.width.mas_equalTo(self.lablePrice);
        make.right.mas_equalTo(self.lablePrice.mas_left).offset(-pad);
        make.centerY.equalTo(self);
        make.left.mas_equalTo(self).offset(pad);
    }];
    
    [self.lablePrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(h);
        make.width.mas_equalTo(self.lablePV);
        make.left.mas_equalTo(self.lablePV.mas_right).offset(pad);
        make.centerY.equalTo(self);
        make.right.mas_equalTo(self).offset(-pad);
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
