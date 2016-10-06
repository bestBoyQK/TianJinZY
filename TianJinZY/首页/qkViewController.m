//
//  qkViewController.m
//  TianJinZY
//
//  Created by mac on 16/5/3.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "qkViewController.h"
#import <Masonry.h>
#import "QkTableViewCell.h"
#import "QkModel.h"
#import "detailViewController.h"
#import "TianJViewController.h"
@interface qkViewController ()<UITableViewDataSource,UITableViewDelegate,shanchuDelegata>
@property(nonatomic,strong)UITableView *tableVW;
@property(nonatomic,strong)UIView *PVView;
@property(nonatomic,strong)NSMutableArray *AllData;
@property(nonatomic,strong)NSMutableArray *allKey;
@property(nonatomic)BOOL isSearch;
@property(nonatomic,assign)BOOL isChaXun;

@property(nonatomic,assign)NSInteger PVsum;
@property(nonatomic,assign)NSInteger Pricesum;

@property(nonatomic,strong)NSMutableArray *arrTainjia;

@end

@implementation qkViewController

//懒加载
- (NSMutableArray *)AllData{
    if (_AllData == nil) {
        _AllData = [[NSMutableArray alloc] init];
    }
    return _AllData;
    
}
- (NSMutableArray *)allKey{
    if (_allKey == nil) {
        _allKey = [[NSMutableArray alloc] init];
    }
    return _allKey;
}
- (NSMutableArray *)arrTainjia {
    if (_arrTainjia == nil) {
        _arrTainjia = [NSMutableArray array];
    }
    return _arrTainjia;
}
- (void)viewWillAppear:(BOOL)animated{

//    cell.buttonSC.hidden = NO;
//    cell.buttonTJ.hidden = NO;

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setViews];
    [self setdata];

    // Do any additional setup after loading the view.
}

- (void)setViews{
    self.qkV = [[Qkview alloc] init];
    [self.view addSubview:self.qkV];
    [self.qkV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        
    }];
    self.tableVW = self.qkV.tableVW;
    [self.qkV.viewTitle.buttonYouce addTarget:self action:@selector(ChaXaction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.qkV.viewTitle.buttonZuoce addTarget:self action:@selector(FanHaction) forControlEvents:(UIControlEventTouchUpInside)];
   
   
    self.isChaXun = NO;
    //代理
    self.tableVW.delegate = self;
    self.tableVW.dataSource = self;

    
}
//数据
- (void)setdata{
    
    _AllData = [NSMutableArray new];
    _allKey = [NSMutableArray new];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Property List.plist" ofType:nil];
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    _allKey = [dic allKeys].mutableCopy;
    
    for (NSString *key in _allKey) {
        NSMutableArray *arrTemp = [[NSMutableArray alloc] init];
        for (NSDictionary *d in dic[key]) {
            QkModel *model = [[QkModel alloc] init];
            [model setValuesForKeysWithDictionary:d];
            //把数据里的string的数据转换成UIimage类型
            [model setValue:[UIImage imageNamed:d[@"image"]] forKey:@"image"];
            [arrTemp addObject:model];
        }
        [_AllData addObject:arrTemp];
       
    }
    
    
}
//PV查询
- (void)ChaXaction{
    
    self.isChaXun = !self.isChaXun;
    if (self.isChaXun == NO) {
        self.qkV.viewPVPrice.lablePrice.text = @"价格:0";
        self.qkV.viewPVPrice.lablePV.text = @"PV:0";
        self.Pricesum = 0;
        self.PVsum = 0;
        self.arrTainjia = nil;
    }
    [self.tableVW reloadData];
    [self.qkV ChaXunSelect];

    
    
}
//返回
- (void)FanHaction{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_AllData[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _AllData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    QkTableViewCell *cell = [QkTableViewCell qktableview:tableView];
    cell.delegata = self;
    cell.model = _AllData[indexPath.section][indexPath.row];

    if ([self.arrTainjia containsObject:indexPath]) {
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        cell.buttonPVTJ.enabled = NO;
    } else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.buttonPVTJ.enabled = YES;
    }
    //处于查询状态.button可以,删除隐藏
    if (self.isChaXun == NO) {
        cell.buttonPVTJ.hidden = YES;
        cell.buttonSC.hidden = NO;
       
    }else {
        cell.buttonPVTJ.hidden = NO;
        cell.buttonSC.hidden = YES;
        
    }
    //
    
    if ([self.textFieldN.text isEqualToString:@"321"]&&[self.textFieldP.text isEqualToString:@"123"]) {
        
    }else{
        cell.buttonSC.hidden = YES;
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//点击跳转到详情页面
    detailViewController *detailV = [[detailViewController alloc] init];
    detailV.model = _AllData[indexPath.section][indexPath.row];
    
    __weak typeof(self) weakSelf = self;
    [detailV sendMessage:^(QkModel *modelF) {
        _AllData[indexPath.section][indexPath.row] = modelF;
        
        [weakSelf.tableVW reloadData];
    }];
    
    [self presentViewController:detailV animated:YES completion:^{
        
    }];
    
    
}

#warning 删除完后,再次进入,那么数据需要更新.
//删除cell上的数据
- (void)shanchuAction:(UITableViewCell *)cell {
    NSIndexPath *index = [self.tableVW indexPathForCell:cell];
    [self.AllData[index.section] removeObjectAtIndex:index.row];
    [self.tableVW reloadSections:[[NSIndexSet alloc] initWithIndex:index.section] withRowAnimation:(UITableViewRowAnimationLeft)];
}
//查询PV和价格的和
- (void)tianjiaAction:(UITableViewCell *)cell {
    NSIndexPath *index = [self.tableVW indexPathForCell:cell];
    QkModel *modle = self.AllData[index.section][index.row];
    self.Pricesum += modle.pv.integerValue;
    self.PVsum += modle.price.integerValue;
    self.qkV.viewPVPrice.lablePV.text = [NSString stringWithFormat:@"PV:%ld",self.Pricesum];
    self.qkV.viewPVPrice.lablePrice.text = [NSString stringWithFormat:@"价格:%ld",self.PVsum];
    
    //点击选中的cell,变色.button的点击事件不可以.
    QkTableViewCell *cel = (QkTableViewCell *)cell;
    cel.contentView.backgroundColor = [UIColor lightGrayColor];
    cel.buttonPVTJ.enabled = NO;
    [self.arrTainjia addObject:index];
    [self.tableVW reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationNone)];//刷新数据
}


//透视图
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //
    UIviewHeader *viewh = [[UIviewHeader alloc] init];
    viewh.buttonTj.tag = 1000 + section;
    [viewh.buttonTj addTarget:self action:@selector(tianjia:) forControlEvents:(UIControlEventTouchUpInside)];
    viewh.buttonTj.hidden = YES;
    //看是否处于管理员状态
    if ([self.textFieldN.text isEqualToString:@"321"]&& [self.textFieldP.text isEqualToString:@"123"]) {
        viewh.buttonTj.hidden = NO;
    }
    viewh.lableHeader.text = _allKey[section];
    return viewh;
    
}
//添加页面的内容.
- (void)tianjia:(UIButton *)sender{
    TianJViewController *tianJV = [[TianJViewController alloc] init];
    [tianJV sendMessage:^(QkModel *modelT) {
        [self.AllData[sender.tag - 1000] addObject:modelT];
        [self.tableVW reloadSections:[[NSIndexSet alloc] initWithIndex:sender.tag - 1000] withRowAnimation:(UITableViewRowAnimationLeft)];
    }];
    [self presentViewController:tianJV animated:YES completion:^{
        
        
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
