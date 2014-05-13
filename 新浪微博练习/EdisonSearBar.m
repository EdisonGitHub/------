//
//  EdisonSearBar.m
//  新浪微博练习
//
//  Created by Edison on 14-5-8.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonSearBar.h"
@interface EdisonSearBar()
//@property (nonatomic,weak)UIImageView *iconView;
@end
@implementation EdisonSearBar
+ (instancetype)searchBar
{
    
   return [[self alloc]init];
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizedImageWithName:@"searchbar_textfield_background"];
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageWithName:@"searchbar_textfield_search_icon"]];
        iconView.contentMode = UIViewContentModeCenter;
       // NSLog(@"leftView %f", self.leftView.frame.size.width);
        //NSLog(@"iconView %f",iconView.frame.size.width);
        self.leftView = iconView;
        self.leftViewMode = UITextFieldViewModeAlways;
        //self.iconView = iconView;
        self.font = [UIFont systemFontOfSize:13];
        self.clearButtonMode = UITextFieldViewModeAlways;
        NSMutableDictionary *attri = [NSMutableDictionary dictionary];
        attri[UITextAttributeTextColor] = [UIColor orangeColor];
        self.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"搜索" attributes:attri];
        //设置按钮右下角按钮样式
        self.returnKeyType = UIReturnKeySearch;
        self.enablesReturnKeyAutomatically = YES;
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置左边iconView的frame
    self.leftView.frame = CGRectMake(0, 0, 30, self.frame.size.height);
    //NSLog(@"leftView %f", self.leftView.frame.size.width);
}

@end
