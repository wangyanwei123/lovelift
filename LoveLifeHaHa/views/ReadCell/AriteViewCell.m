//
//  AriteViewCell.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/30.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "AriteViewCell.h"

@implementation AriteViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{


    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier] ) {
        
        [self createUI];
        
    }

    return self;
}

-(void)createUI{

    _imageView = [FactoryUI createImageViewWithFrame:CGRectMake(10, 10, 120, 90) imageName:nil];

    [self.contentView addSubview:_imageView];
    
    _timelabel = [FactoryUI createLabelWithFrame:CGRectMake(10, _imageView.frame.size.height+ _imageView.frame.origin.y+20, 120, 20) text:nil textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    
    [self.contentView addSubview:_timelabel];
    
    _authorLabel = [FactoryUI createLabelWithFrame:CGRectMake(screen_w-120, _timelabel.frame.origin.y, 110, 20) text:nil textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:14]];
    
    [self.contentView addSubview:_authorLabel];
    
    _titlelabel = [FactoryUI createLabelWithFrame:CGRectMake(_imageView.frame.size.width+10, 30, 100, 60) text:nil textColor:[UIColor lightGrayColor] font:[UIFont systemFontOfSize:12]];
    _titlelabel.numberOfLines = 0;
    
    [self.contentView addSubview:_titlelabel];
    
}

-(void)refreshUI:(ReadModel *)model{

    [_imageView sd_setImageWithURL:[NSURL URLWithString:model.pic] placeholderImage:[UIImage imageNamed:@""]];

    _titlelabel.text = model.title;
    
    _timelabel.text = model.createtime;
    
    _authorLabel.text = model.author;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
