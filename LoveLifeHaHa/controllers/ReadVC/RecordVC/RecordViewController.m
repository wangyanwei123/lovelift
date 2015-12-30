




//
//  RecordViewController.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "RecordViewController.h"

#import "ReadModel.h"
#import "AriteViewCell.h"
#import "AriceXQViewController.h"

@interface RecordViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    int _page;

}
@property(nonatomic,strong)NSMutableArray * RecordArray;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    [self createdata];
    
}
-(void)createUI{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_w, screen_h) style:UITableViewStylePlain];

    _tableView.dataSource =self;
    _tableView.delegate = self;
    
    [self.view addSubview:_tableView];

}
-(void)createdata{

    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadfootData)];

    [_tableView.header beginRefreshing];
}

-(void)loadData{

    _page = 0 ;
    
    self.RecordArray = [[NSMutableArray alloc]init];

    [self getData];
}

-(void)loadfootData{

    _page++;
    
    [self getData];

}

#pragma mark -- 请求数据
-(void) getData{
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //手动设置格式，默认支持json
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:[NSString stringWithFormat:UTTERANCEURL,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * array = responseObject[@"data"];
        
        for (NSDictionary *dic  in array) {
            
            ReadModel * model = [[ReadModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.RecordArray addObject:model];
            
        }
        //停止刷新
        if (_page == 0) {
            
            [_tableView.header endRefreshing];
        }
        else{
            
            [_tableView.footer endRefreshing];
            
        }
        //刷新tableView
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}
#pragma mark -- 创建tableView
-(void) createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_w, screen_h) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource =self;
    
    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.RecordArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AriteViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ArictID"];
    if (!cell) {
        cell = [[AriteViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ArictID"];
    }
    //给cell赋值
    if (self.RecordArray) {
        ReadModel * model = self.RecordArray[indexPath.row];
        [cell refreshUI:model];
    }
    return cell;
}
//给cell添加小动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //设置cell的动画效果为3D效果
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    [UIView animateWithDuration:2 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
    
    
}
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    ArictDetailViewController * vc =[[ArictDetailViewController alloc]init];
//    vc.hidesBottomBarWhenPushed = YES;
//    ReadModel * model = self.dataArray[indexPath.row];
//    vc.model = model;
//    [self.navigationController pushViewController:vc animated:YES];
//}

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
