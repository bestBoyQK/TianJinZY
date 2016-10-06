//
//  UIviewHeader.m
//  TianJinZY
//
//  Created by mac on 16/6/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIviewHeader.h"
#import <Masonry.h>
@implementation UIviewHeader

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViewHeader];
    }
    return self;
}
- (void)setViewHeader{
    self.viewHeader = [[UIView alloc] init];
    self.buttonTj = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [self.buttonTj setTitle:@"添加" forState:(UIControlStateNormal)];
//    [self.buttonTj addTarget:self action:@selector(tianjia) forControlEvents:(UIControlEventTouchDragInside)];
    self.lableHeader = [[UILabel alloc] init];
    [self addSubview:self.viewHeader];
    [self.viewHeader addSubview:self.buttonTj];
    [self.viewHeader addSubview:self.lableHeader];
    [self.viewHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        
    }];
    [self.lableHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(@40);
        
    }];
    [self.buttonTj mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerY.equalTo(self);
    }];
    self.backgroundColor = [UIColor grayColor];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
