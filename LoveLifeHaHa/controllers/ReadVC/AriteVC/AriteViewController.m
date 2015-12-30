


//
//  AriteViewController.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AriteViewController.h"

#import "ReadModel.h"
#import "AriteViewCell.h"

#import "AriceXQViewController.h"

@interface AriteViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * _tableView;
    int  _page;

}

@property(nonatomic,strong)NSMutableArray * AriteArray;

@end


@implementation AriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    [self createReFrech];
}

//****加载数据
-(void)createReFrech{

    _tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];

    _tableView.footer = [MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadFootData)];
    
    //先刷新一次
    [_tableView.header beginRefreshing];
    
}

-(void)loadData{

    _page = 0 ;
    
    self.AriteArray = [[NSMutableArray alloc]init] ;
    
    [self getData];

}
-(void)loadFootData{
    
    _page ++ ;
    
    [self getData];

}

-(void)getData{

    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //加载的数据为html格式
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    [manager GET:[NSString stringWithFormat:ARTICALURL,_page] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray * array = responseObject[@"data"];
        for (NSDictionary * dic in array) {
            
            ReadModel * model = [[ReadModel alloc]init];
            
            [model setValuesForKeysWithDictionary:dic];
            
            [self.AriteArray addObject:model];
            
        }
        
        if (_page == 0) {
            
            [_tableView.header endRefreshing];
        }else{
        
            [_tableView.footer endRefreshing];
        }
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
-(void)createUI{

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_w, screen_h) style:UITableViewStylePlain];
    
    _tableView.dataSource =self ;
    _tableView.delegate = self ;
    
    [self.view addSubview:_tableView];


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.AriteArray.count;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 150;

}

-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AriteViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell = [[AriteViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    ReadModel * model = self.AriteArray[indexPath.row];
    
    [cell refreshUI:model];
    return cell;
}


//给cell的显示添加一个动画

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

    //设置cell的动画效果为3D
    
    cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    
    [UIView animateWithDuration:1 animations:^{
        
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    AriceXQViewController * vc = [[AriceXQViewController alloc]init];

    vc.model = self.AriteArray[indexPath.row];

    [self.navigationController pushViewController:vc animated:YES];
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
