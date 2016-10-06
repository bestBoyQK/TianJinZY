//
//  ReginVIew.m
//  TianJinZY
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ReginVIew.h"

@implementation ReginVIew

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setViews];
    }
    return self;
}

- (void)setViews{
    self.backgroundColor = [UIColor redColor];
    self.viewTitle = [[UIviewTitle alloc] init];
    [self addSubview:self.viewTitle];
    [self.viewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(@64);
        
    }];
    
    [self.viewTitle.buttonYouce setTitle:@"注册" forState:(UIControlStateNormal)];
    //注册
    NSArray *name = @[@"用户名:",@"密码:"];
    __block UILabel *lableTemp = nil;
    for (int i = 0; i<2; i++) {
        UILabel *lable = [[UILabel alloc] init];
        [self addSubview:lable];
        lable.text = name[i];
        int padding = 20;
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(padding);
            make.size.mas_equalTo(CGSizeMake(100, 50));
            if (lableTemp == nil) {
                make.top.mas_equalTo(self).offset(200);
                
            }else{
                make.top.mas_equalTo(lableTemp.mas_bottom).offset(padding);
            }
            lableTemp = lable;
            
        }];
        NSArray *placename = @[@"请输入用户名",@"请输入密码"];
        UITextField *field = [[UITextField alloc] init];
        field.borderStyle = UITextBorderStyleRoundedRect;
        field.placeholder = placename[i];
        field.tag = i+1000;
        [self addSubview:field];
        self.textField = field;
        [field mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lable.mas_right).offset(10);
            make.right.mas_equalTo(self).offset(-padding);
            make.centerY.equalTo(lable);
            make.height.mas_equalTo(@40);
        }];
        switch (field.tag) {
            case 1000:
                self.textFieldName = field;
                break;
            case 1001:
                self.textFieldpassword = field;
                break;
                
            default:
                break;
        }
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
