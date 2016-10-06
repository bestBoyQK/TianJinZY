//
//  ViewController.m
//  TianJinZY
//
//  Created by mac on 16/4/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "ReginViewController.h"
#import "qkViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import "DataHandle.h"

@interface ViewController ()
{

}
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated{
    _textFieldUerN.text = nil;
    _textFieldPasW.text = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setviews];
    [self setLogin];
    //登录注册
    [AVOSCloud setApplicationId:@"0bdFaIjap19ncprqushNp2cN-gzGzoHsz"
                      clientKey:@"8QEAl8YnvrzNAI0p3siRpc70"];
}
- (void)setviews{
    self.view.backgroundColor =[UIColor redColor];
    UILabel *lableTitle = [[UILabel alloc] init];
    [self.view addSubview:lableTitle];
    lableTitle.text = @"P V 查询";
    lableTitle.font = [UIFont systemFontOfSize:22];
    [lableTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(24);
        make.height.mas_equalTo(@40);
    }];
    
    //设置横线
    UIView *hx = [[UIView alloc] init];
    [self.view addSubview:hx];
    hx.backgroundColor = [UIColor blackColor];
    [hx mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(@1);
        make.left.right.equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(64);
        
    }];

    
}
- (void)setLogin{
    
    UILabel *lableUserName = [[UILabel alloc] init];
    [self.view addSubview:lableUserName];
    lableUserName.text = @"用户名:";
    UILabel *lablePasword = [[UILabel alloc] init];
    [self.view addSubview:lablePasword];
    lablePasword.text = @"密码:";
    UIButton *buttonLogin = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:buttonLogin];
    
    buttonLogin.titleLabel.font = [UIFont systemFontOfSize:22];
    [buttonLogin  setTitle:@"登录" forState:(UIControlStateNormal)];
    [buttonLogin setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    [buttonLogin addTarget:self action:@selector(loginButton) forControlEvents:(UIControlEventTouchUpInside)];
    UIButton *buttonRegin = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:buttonRegin];
    buttonRegin.titleLabel.font = [UIFont systemFontOfSize:22];
    [buttonRegin setTitle:@"注册" forState:(UIControlStateNormal)];
    [buttonRegin setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    UITextField *textfiledUserName = [[UITextField alloc] init];
    [buttonRegin addTarget:self action:@selector(reginButton) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:textfiledUserName];
    _textFieldUerN = textfiledUserName;
    _textFieldUerN.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldUerN.placeholder = @"请输入用户名";
    UITextField *textfiledPassword = [[UITextField alloc] init];
    [self.view addSubview:textfiledPassword];
    _textFieldPasW = textfiledPassword;
    _textFieldPasW.borderStyle = UITextBorderStyleRoundedRect;
    _textFieldPasW.placeholder = @"请你输入密码";
    CGFloat padding = 10;
    [lableUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 40));
        make.left.mas_equalTo(padding*5);
        make.top.mas_equalTo(200);
    }];
    [lablePasword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(lableUserName);
        make.centerX.mas_equalTo(lableUserName);
        make.top.mas_equalTo(lableUserName).offset(padding*5);
        
    }];
    [textfiledUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(lableUserName).offset(padding*7);
        make.right.mas_equalTo(self.view).offset(-padding*2);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(lableUserName);
    }];
    [textfiledPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(textfiledUserName);
        make.centerX.equalTo(textfiledUserName);
        make.centerY.equalTo(lablePasword);
    }];
    
    [buttonLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 50));
        make.centerX.mas_equalTo(self.view).offset(-100);
        make.bottom.mas_equalTo(self.view).offset(-250);
        
    }];
    [buttonRegin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(buttonLogin);
        make.centerY.mas_equalTo(buttonLogin);
        make.centerX.mas_equalTo(self.view).offset(100);
        
    }];
    
    
}
//登录
- (void)loginButton{
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
        //登录调到首页
        qkViewController *view = [[qkViewController alloc] init];
        view.textFieldN = _textFieldUerN;
        view.textFieldP = _textFieldPasW;
//    单例
    DataHandle *dan = [DataHandle shareHandle];
    dan.userName = self.textFieldUerN.text;
    dan.passWord = self.textFieldPasW.text;
        [self presentViewController:view animated:YES completion:nil];
    }];
    
    //
    if ([self.textFieldUerN.text isEqualToString:@"321"] && [self.textFieldPasW.text isEqualToString:@"123"]) {
        UIAlertController *alter2 = [UIAlertController alertControllerWithTitle:@"提示" message:@"管理员登录" preferredStyle:(UIAlertControllerStyleAlert)];
        [alter2 addAction:action];
        [self presentViewController:alter2 animated:YES completion:nil];
        
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户登陆" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
        

//    
////    leanCloud 需要网络
////    通过用户名密码登录
//    [AVUser logInWithUsernameInBackground:self.textFieldUerN.text password:self.textFieldPasW.text block:^(AVUser *user, NSError *error) {
//        if (user != nil) {
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [self.navigationController popViewControllerAnimated:YES];
//                //登录调到首页
//                qkViewController *view = [[qkViewController alloc] init];
//                view.textFieldN = _textFieldUerN;
//                view.textFieldP = _textFieldPasW;
//                
//                //单例
//                DataHandle *dan = [DataHandle shareHandle];
//                dan.userName = self.textFieldUerN.text;
//                dan.passWord = self.textFieldPasW.text;
//                [self presentViewController:view animated:YES completion:nil];
//            }];
//            
//           //设置管理员为@"321",@"123"
//            if ([_textFieldUerN.text isEqualToString:@"321"] && [_textFieldPasW.text  isEqual: @"123"]) {
//                UIAlertController *alter2 = [UIAlertController alertControllerWithTitle:@"提示" message:@"管理员登录" preferredStyle:(UIAlertControllerStyleAlert)];
//               [alter2 addAction:action];
//               [self presentViewController:alter2 animated:YES completion:nil];
//              
//            }else{
//               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"登陆成功" preferredStyle:UIAlertControllerStyleAlert];
//                [alert addAction:action];
//                [self presentViewController:alert animated:YES completion:nil];
//
//            }
//        } else {
//            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"用户名或密码不正确或重复注册" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
//            [alert addAction:action];
//            [self presentViewController:alert animated:YES completion:nil];
//         
//        }
//    }];



    
}
//注册
- (void)reginButton{
    ReginViewController *regin = [[ReginViewController alloc] init];
    [self presentViewController:regin animated:YES completion:^{
        
        
    }];
}

//回收键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_textFieldPasW resignFirstResponder];
    [_textFieldUerN resignFirstResponder];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
