//
//  HomeCell.h
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface HomeCell : UITableViewCell
{
//    tupian
    UIImageView *_imageView;
//    biaoti
    UILabel *_titleLabel;
}

- (void)refresjUI:(HomeModel *)model;

@end
