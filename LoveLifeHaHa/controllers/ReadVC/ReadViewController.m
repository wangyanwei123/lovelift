//
//  ReadViewController.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "ReadViewController.h"
#import "AriteViewController.h"
#import "RecordViewController.h"

@interface ReadViewController ()<UIScrollViewDelegate>
{
    
    UIScrollView * _scrollView;
    UISegmentedControl * _segmentControl;
}
@end

@implementation ReadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createdaohang];
    
    [self createUI];
}

-(void)createdaohang{
    
    _segmentControl = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    
    [_segmentControl insertSegmentWithTitle:@"读美文" atIndex:0 animated:YES];
    [_segmentControl insertSegmentWithTitle:@"看语录" atIndex:1 animated:YES];
    
    //字体颜色
    _segmentControl.tintColor = [UIColor whiteColor];
    
    //设置默认选中读美文
    _segmentControl.selectedSegmentIndex = 0 ;
    
    //相应方法
    [_segmentControl addTarget:self action:@selector(changOption:) forControlEvents:UIControlEventValueChanged];
    
    //在导航条上添加视图
    self.navigationItem.titleView = _segmentControl;
}

-(void)createUI{
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_w, screen_h)];
    
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
    
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake(screen_w*2, 0);
    
    //实例化控制器
    
    AriteViewController * arite = [[AriteViewController alloc]init];
    
    RecordViewController * recod = [[RecordViewController alloc]init];

    //看语录页面的背景颜色***
   // recod.view.backgroundColor = [UIColor redColor];
    
    NSArray * VCArray = @[arite,recod];
    
    //滚动框架的实现
    
    int i = 0;
    
    for (UIViewController * vc in VCArray) {
        
        vc.view.frame = CGRectMake(i*screen_w, 0, screen_w, screen_h);
        
        [self addChildViewController:vc];
        
        [_scrollView addSubview:vc.view];
        
        i++;
    }
    
}
//******//相应方法

-(void)changOption:(UISegmentedControl *)segment{

    
    _scrollView.contentOffset = CGPointMake(segment.selectedSegmentIndex * screen_w, 0);


}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    _segmentControl.selectedSegmentIndex = scrollView.contentOffset.x/screen_w;

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
