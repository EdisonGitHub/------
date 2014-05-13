//
//  EdisonTabBar.m
//  新浪微博练习
//
//  Created by Edison on 14-5-6.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonTabBar.h"
#import "EdisonButton.h"
@interface EdisonTabBar()
@property (nonatomic,strong)NSMutableArray *tabBarButtons;
@property (nonatomic,weak)UIButton *plusButton;
@property (nonatomic,weak)EdisonButton *selectedButton;
@end
@implementation EdisonTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [NSMutableArray array];
    }
    return _tabBarButtons;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (!iOS7) {
            self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
            //添加“＋”按钮
            UIButton *plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
            [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
            [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
            [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        //加号按钮的bounds（大小）
            plusButton.bounds = CGRectMake(0, 0, plusButton.currentBackgroundImage.size.width, plusButton.currentBackgroundImage.size.height);
            [self addSubview:plusButton];
            self.plusButton = plusButton;
        //NSLog(@"%f",self.frame.size.width);
        }    
    
    return self;
}
- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    EdisonButton *button = [[EdisonButton alloc]init];
    [self addSubview:button];
    //把按钮添加到数组
    [self.tabBarButtons addObject:button];
    //设置按钮
    button.item =item;
    
    //监听按钮点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //选中第一个按钮
    if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
    
}

- (void)buttonClick:(EdisonButton *)button
{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:self.selectedButton.tag to:button.tag];
    }
    //1当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    //2让被点击的按钮变为选中
    button.selected = YES;
    //3给被点击的按钮成为选中的按钮
    self.selectedButton = button;
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // NSLog(@"%f",self.frame.size.width);
    //加号按钮的位置
    self.plusButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    //frame
    float buttonW = self.frame.size.width / self.subviews.count;
    float buttonY = 0;
    float buttonH = self.frame.size.height;
    for (int index = 0; index < self.tabBarButtons.count;index++) {
        //取出按钮
        EdisonButton *button = self.tabBarButtons[index];
        //给按钮设置frame
        float buttonX = index * buttonW ;
        if (index>1) {
            buttonX = buttonX +buttonW;
        }
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        button.tag = index;

   }
    
}

@end
