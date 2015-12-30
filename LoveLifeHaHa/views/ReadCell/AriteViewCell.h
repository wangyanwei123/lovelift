//
//  AriteViewCell.h
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadModel.h"

@interface AriteViewCell : UITableViewCell

{

    UIImageView * _imageView;
    
    UILabel * _timelabel ;
    
    UILabel * _authorLabel;
    
    UILabel * _titlelabel;
    
}

-(void)refreshUI:(ReadModel *)model;

@end
