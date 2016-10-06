//
//  detailViewController.m
//  TianJinZY
//
//  Created by mac on 16/5/5.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "detailViewController.h"
#import <Masonry.h>
#import "DataHandle.h"

@interface detailViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (nonatomic,assign)BOOL isXiugai;

@end

@implementation detailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViews];
    [self getData];
    [self delegate];
    
    
}
- (void)delegate{
    self.detailV.textFieldCounts.delegate = self;
    self.detailV.textFieldPrice.delegate = self;
    self.detailV.textFieldPV.delegate = self;
    self.detailV.textFieldTime.delegate = self;
}

- (void)setViews{
    self.isXiugai = NO;
    self.view.backgroundColor = [UIColor redColor];
    self.detailV = [[detail alloc] init];
    [self.view addSubview:self.detailV];
    [self.detailV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    [self.detailV.viewTitle.buttonZuoce addTarget:self action:@selector(fanhui) forControlEvents:(UIControlEventTouchUpInside)];
    //
    [self.detailV.viewTitle.buttonYouce addTarget:self action:@selector(youce) forControlEvents:(UIControlEventTouchUpInside)];
    
//
    DataHandle *dan = [DataHandle shareHandle];
    self.userName = dan.userName;
    self.passWord = dan.passWord;
    if ([self.userName isEqualToString:@"321"] && [self.passWord isEqualToString:@"123"]) {
        [self.detailV.viewTitle.buttonYouce setTitle:@"修改" forState:(UIControlStateNormal)];
        self.detailV.viewMiddle.hidden = NO;
        
    }else{
        [self.detailV.viewTitle.buttonYouce setTitle:@"" forState:(UIControlStateNormal)];
        self.detailV.viewMiddle.hidden = NO;
    }
//   头像图片
    self.detailV.imageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.detailV.imageV addGestureRecognizer:tap];
}
- (void)getData{
    self.detailV.textFieldName.text   = self.model.name;
    self.detailV.textFieldPrice.text  = self.model.price;
    self.detailV.textFieldCounts.text = self.model.counts;
    self.detailV.textFieldNumber.text = self.model.number;
    self.detailV.textFieldTime.text   = self.model.time;
    self.detailV.textFieldPV.text     = self.model.pv;
    self.detailV.imageV.image         = self.model.image;

}
- (void)fanhui{
    QkModel *model = [[QkModel alloc] init];
    model.name    = self.detailV.textFieldName.text;
    model.price   = self.detailV.textFieldPrice.text;
    model.counts  = self.detailV.textFieldCounts.text;
    model.number  = self.detailV.textFieldNumber.text;
    model.time    = self.detailV.textFieldTime.text;
    model.pv      = self.detailV.textFieldPV.text;
    model.image   = self.detailV.imageV.image;
    //
    self.block(model);
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
//block方法的实现
- (void)sendMessage:(sendMessageBlock)block{
    self.block = block;
}
//修改
- (void)youce{
    self.isXiugai = !self.isXiugai;
    if (self.isXiugai == NO ) {
        [self.detailV.viewTitle.buttonYouce setTitle:@"修改" forState:(UIControlStateNormal)];
        self.detailV.viewMiddle.hidden = NO;
    }else{
        [self.detailV.viewTitle.buttonYouce setTitle:@"完成" forState:(UIControlStateNormal)];
        self.detailV.viewMiddle.hidden = YES;
    }
}
//
- (void)tap{
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
    self.detailV.imageV.image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.detailV endEditing:YES];
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
        
        self.view.frame = rect;
    }];
}
//键盘遮挡
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    CGRect frame = textField.frame;
    CGFloat heights = self.view.frame.size.height;
    // 当前点击textfield的坐标的Y值 + 当前点击textFiled的高度 - （屏幕高度- 键盘高度 - 键盘上tabbar高度）
    // 在这一部 就是了一个 当前textfile的的最大Y值 和 键盘的最全高度的差值，用来计算整个view的偏移
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
