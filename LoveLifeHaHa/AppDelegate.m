//
//  AppDelegate.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "MyTabBarController.h"
#import "GudiePageView.h"

//凑提效果
#import "MMDrawerController.h"
#import "LEFTViewController.h"

//支持QQ
#import "UMSocialQQHandler.h"
//支持微信
#import "UMSocialWechatHandler.h"
//支持sina
#import "UMSocialSinaHandler.h"

@interface AppDelegate ()

@property (nonatomic, strong) MyTabBarController *myTabbar;
@property (nonatomic, strong) GudiePageView *gudieView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.myTabbar = [[MyTabBarController alloc]init];
    
    
    LEFTViewController *leftVc = [[LEFTViewController alloc]init];
    
    MMDrawerController *drawerVC = [[MMDrawerController alloc]initWithCenterViewController:self.myTabbar leftDrawerViewController:leftVc];
    
//    设置抽屉打开和关闭的模式
    drawerVC.openDrawerGestureModeMask = MMOpenDrawerGestureModeAll;
    drawerVC.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
//    设置作业面打开之后的宽度
    drawerVC.maximumLeftDrawerWidth = screen_w - 100;
    
    self.window.rootViewController = drawerVC;
    
    
   //    修改状态栏的颜色，第二种方式(需要和plist一起用)，第一种方式在rootVC中。
    //在plist文件中 View controller-based status bar appearance   -------NO
    
    //状态栏为白色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    
    //    添加引导页
    [self createGudiePage];
    
    
    //添加友盟分享
    [self addUMShare];
    
    
    
    return YES;
}

#pragma mark ----友盟分享

-(void)addUMShare{

    //注册友盟分享
    [UMSocialData setAppKey:APPKEY];
    
    //设置QQ的appid,appkey和url
    
    [UMSocialQQHandler setQQWithAppId:@"1104908293" appKey:@"MnGtpPN5AiB6MNvj" url:nil];
    //设置微信的appid,appsecret和url
    [UMSocialWechatHandler setWXAppId:@"wx12b249bcbf753e87" appSecret:@"0a9cd00c48ee47a9b23119086bcd3b30" url:nil];
    
     //打开sina微博的sso开关
    [UMSocialSinaHandler openSSOWithRedirectURL:nil];
    
    //隐藏未安装的客户端（主要针对qq和微信）
    [UMSocialConfig hiddenNotInstallPlatforms:@[UMShareToQQ,UMShareToQzone,UMShareToWechatTimeline]];
    

}


- (void)createGudiePage
{
    //单例
    if (![[[NSUserDefaults standardUserDefaults]objectForKey:@"isRuned"]boolValue]) {
        NSArray *imageArray = @[@"welcome1",@"welcome2",@"welcome3"];
        self.gudieView = [[GudiePageView alloc]initWithFrame:self.window.bounds ImageArray:imageArray];
        
        [self.myTabbar.view addSubview:self.gudieView];
        
        
//        第一次运行完成记录
        [[NSUserDefaults standardUserDefaults]setObject:@YES forKey:@"isRuned"];
    }
    
    [self.gudieView.GoInButton addTarget:self action:@selector(goinbuttonClick) forControlEvents:(UIControlEventTouchUpInside)];
}





- (void)goinbuttonClick
{
    [self.gudieView removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
