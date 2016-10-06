//
//  ReginViewController.m
//  TianJinZY
//
//  Created by mac on 16/4/29.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ReginViewController.h"
#import <Masonry.h>

@interface ReginViewController ()

@end

@implementation ReginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setviews];
    
}
- (void)setviews{
    self.reginV = [[ReginVIew alloc] init];
    [self.view addSubview:self.reginV];
    [self.reginV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.reginV.viewTitle.buttonZuoce addTarget:self action:@selector(fanhui) forControlEvents:(UIControlEventTouchUpInside)];
    [self.reginV.viewTitle.buttonYouce addTarget:self action:@selector(zhuce) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}
- (void)fanhui{
    [self dismissViewControllerAnimated:YES completion:^{
        
        
    }];
}
- (void)zhuce{
    
    AVUser *user = [AVUser user];
    user.username = self.reginV.textFieldName.text;
    user.password = self.reginV.textFieldpassword.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"注册成功" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self fanhui];
            }];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"用户名或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        }
    }];

  
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
        [self.reginV.textField resignFirstResponder];

        //输入完自动回收键盘
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
