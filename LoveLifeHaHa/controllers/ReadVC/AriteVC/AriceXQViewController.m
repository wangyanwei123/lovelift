//
//  AriceXQViewController.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AriceXQViewController.h"

@interface AriceXQViewController ()

@end

@implementation AriceXQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUI];
    
    [self getData];
}

-(void)getData{

    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screen_w, screen_h)];
    //loadHTMLString 加载的类似标签的字符串, loadRequest加载的是网址
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:ARTICALDETAILURL,self.model.dataID]]]];
     //使得webView适应屏幕大小
     webView.scalesPageToFit = YES ;
     
     [self.view addSubview:webView];

}
-(void)createUI{

    self.titleLabel.text = @"详情";
    [self.leftButton setImage:[UIImage imageNamed:@"iconfont-back"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"iconfont-fenxiang"] forState:UIControlStateNormal];
    
    
    [self setLeftButtonClick:@selector(leftClick)];
    [self setRightButtonClick:@selector(rightClick)];
}

-(void)leftClick{

    [self.navigationController popViewControllerAnimated:YES];

}

//分享
-(void)rightClick{

    //下载网络图片
    UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.model.pic]]];

    [UMSocialSnsService presentSnsIconSheetView:self appKey:APPKEY shareText:[NSString stringWithFormat:ARTICALDETAILURL,self.model] shareImage:image shareToSnsNames:@[UMShareToQQ,UMShareToQzone,UMShareToSina,UMShareToWechatTimeline] delegate:nil];
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
