//
//  GudiePageView.m
//  LoveLifeHaHa
//
//  Created by qianfeng on 15/12/29.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import "GudiePageView.h"

@interface GudiePageView ()
{
    UIScrollView *_scrollView;
}

@end

@implementation GudiePageView


- (id)initWithFrame:(CGRect)frame ImageArray:(NSArray *)imageArray
{
    if (self = [super initWithFrame:frame] ) {
        _scrollView = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, screen_w, screen_h + 64))];
        _scrollView.pagingEnabled = YES;
        _scrollView.contentSize = CGSizeMake(imageArray.count * screen_w, screen_h + 64);
        
        _scrollView.showsVerticalScrollIndicator = NO;
        
        [self addSubview:_scrollView];
        
        for (int i = 0; i <imageArray.count; i++) {
            
            UIImageView * imaView = [FactoryUI createImageViewWithFrame:(CGRectMake(i * screen_w, 0, screen_w, screen_h + 64)) imageName:imageArray[i]];
//            打开交互
            imaView.userInteractionEnabled = YES;
            
            
            [_scrollView addSubview:imaView];
            
            if (i == imageArray.count - 1) {
                
                self.GoInButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
                self.GoInButton.frame = CGRectMake(200, 300, 80, 80);
                [self.GoInButton setImage:[UIImage imageNamed:@"LinkedIn"] forState:(UIControlStateNormal)];
                [imaView addSubview:self.GoInButton];
            }
        }
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
