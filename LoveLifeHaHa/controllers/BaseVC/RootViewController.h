//
//  RootViewController.h
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController
//左按钮
@property(nonatomic,strong) UIButton* leftButton;
//标题
@property(nonatomic,strong) UILabel* titleLabel;
//右按钮
@property(nonatomic,strong) UIButton* rightButton;


- (void)setLeftButtonClick:(SEL)selector;
- (void)setRightButtonClick:(SEL)selector;

@end
