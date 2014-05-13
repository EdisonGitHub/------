//
//  EdisonNavigationController.m
//  新浪微博练习
//
//  Created by Edison on 14-5-7.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonNavigationController.h"

@interface EdisonNavigationController ()

@end

@implementation EdisonNavigationController
//第一次使用这个类的时候调用
+ (void)initialize
{
   //设置导航栏主题
    [self setupNavBarTheme];
    //设置导航栏按钮
    [self setupBarButtonItem];
}
//设置导航栏按钮主题(UIBarButtonItem)
+ (void)setupBarButtonItem
{
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    if (!iOS7) {
        //设置背景
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [item setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];

    }
        //设置文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[UITextAttributeTextColor] = iOS7?[UIColor orangeColor]:[UIColor grayColor];
    attrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    attrs[UITextAttributeFont] = [UIFont systemFontOfSize:iOS7 ? 14: 12];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:attrs forState:UIControlStateHighlighted];
    
}
//设置导航栏主题(UINavigationBar)
+ (void)setupNavBarTheme
{
    //取出appearance对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    if (!iOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
    }
    //设置标题属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[UITextAttributeTextColor] = [UIColor blackColor];
    attrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    attrs[UITextAttributeFont] = [UIFont boldSystemFontOfSize:19];
    [navBar setTitleTextAttributes:attrs];

}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
         viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}


@end
