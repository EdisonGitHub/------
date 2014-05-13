//
//  EdisonWeiboTool.m
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonWeiboTool.h"
#import "EdisonTabBarViewController.h"
#import "EdisonOauthViewController.h"
@implementation EdisonWeiboTool
//选择根控制器
+ (void)chooseRootController
{
    NSString *key = @"CFBundleVersion";
    
    // 取出沙盒中存储的上次使用软件的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults stringForKey:key];
    //NSLog(@"lastVersion%@",lastVersion);
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    //NSLog(@"currentVersion%@",currentVersion);
    
    if ([currentVersion isEqualToString:lastVersion]) {
        // 显示状态栏
        [UIApplication sharedApplication].statusBarHidden = NO;
        [UIApplication sharedApplication].keyWindow.rootViewController = [[EdisonTabBarViewController alloc] init];
    } else { // 新版本
        [UIApplication sharedApplication].keyWindow.rootViewController = [[EdisonTabBarViewController alloc] init];
        //            // 存储新版本
        [defaults setObject:currentVersion forKey:key];
        [defaults synchronize];
    }
}
@end
