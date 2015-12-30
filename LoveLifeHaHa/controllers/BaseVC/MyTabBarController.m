//
//  MyTabBarController.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "ReadViewController.h"
#import "FoofViewController.h"
#import "MyViewController.h"
#import "MusicViewController.h"


@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createVC];
    [self createTabbarItem];
}

- (void)createVC
{
//    实例化子页面
//    首页
    HomeViewController * homeVC = [[HomeViewController alloc]init];
    UINavigationController * homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
//    食物
    FoofViewController * foodVC = [[FoofViewController alloc]init];
    UINavigationController * foodNav = [[UINavigationController alloc]initWithRootViewController:foodVC];
//    阅读
    ReadViewController * readVC = [[ReadViewController alloc]init];
    UINavigationController * readNav = [[UINavigationController alloc]initWithRootViewController:readVC];
//    音乐
    MusicViewController * musicVC = [[MusicViewController alloc]init];
    UINavigationController * musicNav = [[UINavigationController alloc]initWithRootViewController:musicVC];
    
    MyViewController * myVC = [[MyViewController alloc]init];
    UINavigationController * myNav = [[UINavigationController alloc]initWithRootViewController:myVC];
    
//    添加到viewcontrollers
    self.viewControllers = @[homeNav,readNav,foodNav,musicNav,myNav];
    
}

- (void)createTabbarItem
{
    NSArray * unselectdeImageArray = @[@"ic_tab_home_normal@2x",@"ic_tab_category_normal@2x",@"iconfont-iconfontmeishi",@"ic_tab_select_normal@2x",@"ic_tab_profile_normal_female@2x"];
    
    NSArray * selectedImageArray = @[@"ic_tab_home_selected@2x",@"ic_tab_category_selected@2x",@"iconfont-iconfontmeishi-2",@"ic_tab_select_selected@2x",@"ic_tab_profile_selected_female@2x"];

    NSArray * titleArray = @[@"首页",@"阅读",@"美食",@"音乐",@"我的"];
    
    for (int i = 0; i < self.tabBar.items.count; i++) {
//        处理未处理选中的图片，使用图片原始尺寸
        UIImage *unselectedImage = [UIImage imageNamed:unselectdeImageArray[i]];
        unselectedImage = [unselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        UIImage *seleImage = [UIImage imageNamed:selectedImageArray[i]];
        seleImage = [seleImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
//      拿到item，并且赋值
        UITabBarItem *item = self.tabBar.items[i];
        item = [item initWithTitle:titleArray[i] image:unselectedImage selectedImage:seleImage];
    }
    
//    设置选中时标题的颜色
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:(UIControlStateSelected)];
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
