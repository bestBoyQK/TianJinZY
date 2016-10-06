//
//  TianJViewController.m
//  TianJinZY
//
//  Created by mac on 16/5/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "TianJViewController.h"

@interface TianJViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>
@property (nonatomic,assign)CGSize Kbsize;

@end
@implementation TianJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setviews];
    [self delegate];//textField代理事件,解决键盘遮挡问题
}
- (void)delegate{
    self.tianJiaV.textFieldCounts.delegate = self;
    self.tianJiaV.textFieldPrice.delegate = self;
    self.tianJiaV.textFieldPV.delegate = self;
    self.tianJiaV.textFieldTime.delegate = self;
}
- (void)setviews{
    self.view.backgroundColor = [UIColor redColor];
    self.tianJiaV = [[TianJ alloc] init];
    [self.tianJiaV.viewTitle.buttonYouce  setTitle:@"完成" forState:(UIControlStateNormal)];
    [self.tianJiaV.viewTitle.buttonYouce addTarget:self action:@selector(wancheng) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.tianJiaV];
    [self.tianJiaV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    [self.tianJiaV.viewTitle.buttonZuoce addTarget:self action:@selector(fanhui) forControlEvents:(UIControlEventTouchUpInside)];

    //image上,添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    self.tianJiaV.imageV.userInteractionEnabled = YES;
    [self.tianJiaV.imageV addGestureRecognizer:tap];
}
//完成
- (void)wancheng{
    
    QkModel *model = [[QkModel alloc] init];
    model.name    = self.tianJiaV.textFieldName.text;
    model.price   = self.tianJiaV.textFieldPrice.text;
    model.counts  = self.tianJiaV.textFieldCounts.text;
    model.number  = self.tianJiaV.textFieldNumber.text;
    model.time    = self.tianJiaV.textFieldTime.text;
    model.pv      = self.tianJiaV.textFieldPV.text;
    model.image   = self.tianJiaV.imageV.image;
    //
    self.block(model);
    [self fanhui];
}
- (void)sendMessage:(sendMessageTianJiaBlock)block{
    
    self.block = block;
}

- (void)fanhui{
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.tianJiaV endEditing:YES];
    
  [UIView animateWithDuration:0.3 animations:^{
      
      CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
      
      self.view.frame = rect;
  }];
 
}

- (void)tapAction{
    
    UIImagePickerController *pick = [[UIImagePickerController alloc] init];
       //设置UIImagePickerController类型(相册/相机/图片库)
    if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
        pick.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
       pick.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
       
    }
    //
    pick.delegate = self;
    pick.allowsEditing = YES;
    [self presentViewController:pick animated:YES completion:nil];
    
}
//点击图片库中的相片触发事件,并将点击的图片返回
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    self.tianJiaV.imageV.image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

//键盘遮挡
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect frame = textField.frame;
    
    CGFloat heights = self.view.frame.size.height;
    // 当前点击textfield的坐标的Y值 + 当前点击textFiled的高度 - （屏幕高度- 键盘高度 - 键盘上tabbar高度）
    
    // 在这一部 就是了一个 当前textfile的的最大Y值 和 键盘的最全高度的差值，用来计算整个view的偏移量
    
    int offset = frame.origin.y + frame.size.height- ( heights - 216.0-64);//键盘高度216

    [UIView animateWithDuration:0.3 animations:^{
        
        float width = self.view.frame.size.width;
        
        float height = self.view.frame.size.height;
        
        if(offset > 0)
            
        {
            
            CGRect rect = CGRectMake(0.0f, -offset,width,height);
            
            self.view.frame = rect;
            
        }
        

    }];
    
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
