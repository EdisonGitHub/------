//
//  EdisonButton.m
//  新浪微博练习
//
//  Created by Edison on 14-5-6.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonButton.h"
#define EdisonButtonImageRatio 0.6
@implementation EdisonButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        //设置按钮颜色用setTitleColor forState:
        [self setTitleColor:iOS7? [UIColor blackColor]:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        //self.titleLabel.textColor = [UIColor orangeColor];
        if (!iOS7) {
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
    }
    return self;
}
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
}
//按钮内部设置图片和文字的frame
- (void)setHighlighted:(BOOL)highlighted{}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * EdisonButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * EdisonButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
@end
