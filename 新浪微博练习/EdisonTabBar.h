//
//  EdisonTabBar.h
//  新浪微博练习
//
//  Created by Edison on 14-5-6.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EdisonTabBar;
@protocol EdisonTabBarDelegate <NSObject>
@optional
- (void)tabBar:(EdisonTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;
@end
@interface EdisonTabBar : UIView
@property (nonatomic,weak)id<EdisonTabBarDelegate>delegate;
- (void)addTabBarButtonWithItem:(UITabBarItem *)item;
@end
