//
//  detail.m
//  TianJinZY
//
//  Created by mac on 16/5/30.
//  Copyright © 2016年 mac. All rights reserved.
//
/*
 @property (strong, nonatomic)UIImageView *imageV;
 @property (strong, nonatomic)UITextField *textFieldName;
 @property (strong, nonatomic)UITextField *textFieldPrice;
 @property (strong, nonatomic)UITextField *textFieldCounts;
 @property (strong, nonatomic)UITextField *textFieldPV;
 @property (strong, nonatomic)UITextField *textFieldTime;
 @property (strong, nonatomic)UITextField *textFieldNumber;
 */


#import "detail.h"
#import <Masonry.h>

@implementation detail

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addAllviews];
    }
    return self;
}
- (void)addAllviews{
    self.viewTitle = [[UIviewTitle alloc] init];
    [self addSubview:self.viewTitle];
    [self.viewTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(@64);
        
    }];

    
    self.imageV = [[UIImageView alloc] init];
    self.imageV.image = [UIImage imageNamed:@"1.jpg"];
    [self addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 150));
        make.centerX.equalTo(self);
        make.top.mas_equalTo(self).offset(100);
        
    }];
    
    //注册
    NSArray *name = @[@"产品名称:",@"产品编号",@"价格:",@"PV:",@"保质期:",@"净含量:"];
    __block UILabel *lableTemp = nil;
    for (int i = 0; i<6; i++) {
        UILabel *lable = [[UILabel alloc] init];
        [self addSubview:lable];
        lable.text = name[i];
        int padding = 10;
        [lable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(padding);
            make.size.mas_equalTo(CGSizeMake(100, 50));
            if (lableTemp == nil) {
                make.top.mas_equalTo(self).offset(264);
                
            }else{
                make.top.mas_equalTo(lableTemp.mas_bottom).offset(padding);
            }
            lableTemp = lable;
            
        }];
        UITextField *field = [[UITextField alloc] init];
        field.borderStyle = UITextBorderStyleRoundedRect;
        field.backgroundColor = [UIColor redColor];
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
                self.textFieldNumber = field;
                break;
            case 1002:
                self.textFieldPrice= field;
                break;
            case 1003:
                self.textFieldPV= field;
                break;
            case 1004:
                self.textFieldTime = field;
                break;
            case 1005:
                self.textFieldCounts= field;
                break;
                
            default:
                break;
        }
    
    }

    //加一个view.当用户进来的时候,就不可以点击
    self.viewMiddle = [[UIView alloc] init];
    self.viewMiddle.hidden = YES;
    [self addSubview:self.viewMiddle];
    [self.viewMiddle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.mas_equalTo(self).offset(64);
        
    }];
}

//- (void)keyboardWillChangeFrameNotification:(NSNotification *)notification {
//    // 获取键盘基本信息（动画时长与键盘高度）
//    NSDictionary *userInfo = [notification userInfo];
//    CGRect rect =
//    [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
//    
//    CGFloat keyboardHeight = CGRectGetHeight(rect);
//    CGFloat keyboardDuration =
//    [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    
//    // 修改下边距约束
//    [_textField mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.bottom.mas_equalTo(-keyboardHeight); }];
//    
//    // 更新约束
//    
//    [UIView animateWithDuration:keyboardDuration animations:^{
//        [self layoutIfNeeded]; }];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
