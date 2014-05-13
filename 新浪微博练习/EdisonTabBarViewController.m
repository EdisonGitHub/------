//
//  EdisonTabBarViewController.m
//  新浪微博练习
//
//  Created by Edison on 14-5-5.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonTabBarViewController.h"
#import "EdisonHomeViewController.h"
#import "EdisonMessageViewController.h"
#import "EdisonDiscoverViewController.h"
#import "EdisonMeViewController.h"
#import "UIImage+Edison.h"
#import "EdisonTabBar.h"
#import "EdisonNavigationController.h"
@interface EdisonTabBarViewController ()<EdisonTabBarDelegate>
//自定义tabbar
@property (nonatomic,weak)EdisonTabBar *customTabBar;
@end

@implementation EdisonTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化tabbar
    [self setupTabbar];
   //初始化所有的子控制器
    [self setupAllViewController];
  
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // NSLog(@"%@",self.tabBar.subviews);
    for (UIView *child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
    
}


//初始化setupTabbar
- (void)setupTabbar
{
    EdisonTabBar *customTabBar = [[EdisonTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    _customTabBar = customTabBar;
}
- (void)tabBar:(EdisonTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    //设置title
    self.selectedIndex = to;
}
- (void)setupAllViewController
{
    //首页
    EdisonHomeViewController *home = [[EdisonHomeViewController alloc]init];
    //    home.tabBarItem.title = @"首页";
    //    home.navigationItem.title = @"首页";
    
    [self setUpChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    //消息
    EdisonMessageViewController *message = [[EdisonMessageViewController alloc]init];
    [self setUpChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    //广场
    EdisonDiscoverViewController *discover = [[EdisonDiscoverViewController alloc]init];
    [self setUpChildViewController:discover title: @"广场" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    //我
    EdisonMeViewController *me = [[EdisonMeViewController alloc]init];
    [self setUpChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}
//初始化一个子控制器
- (void)setUpChildViewController:(UIViewController *)childVc title:(NSString *)title imageName: (NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
   
    childVc.title = title;
    //设置选中的图标
    if (iOS7) {
//        imageName = [imageName stringByAppendingString:@"_os7"];
//        selectedImageName = [selectedImageName stringByAppendingString:@"_os7"];
        //不让渲染成蓝色
        childVc.tabBarItem.selectedImage = [[UIImage imageWithName:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }else{
        childVc.tabBarItem.selectedImage = [UIImage imageWithName:selectedImageName];
    }
    //设置图标
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    //设置导航栏
    EdisonNavigationController *Nav = [[EdisonNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:Nav];
    //添加customtabbar内部的按钮
    [self.customTabBar addTabBarButtonWithItem:childVc.tabBarItem];

}

@end
