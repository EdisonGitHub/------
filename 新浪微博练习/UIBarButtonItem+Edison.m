//
//  UIBarButtonItem+Edison.m
//  新浪微博练习
//
//  Created by Edison on 14-5-7.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "UIBarButtonItem+Edison.h"

@implementation UIBarButtonItem (Edison)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageWithName:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageWithName:highIcon] forState:UIControlStateHighlighted];
    btn.bounds = CGRectMake(0, 0,btn.currentBackgroundImage.size.width , btn.currentBackgroundImage.size.height);
    //没有target ，指向UIBarButtonItem，而它没有find／pop方法
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc]initWithCustomView:btn];

}

@end
