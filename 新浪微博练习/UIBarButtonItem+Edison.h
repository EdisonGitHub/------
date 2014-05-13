//
//  UIBarButtonItem+Edison.h
//  新浪微博练习
//
//  Created by Edison on 14-5-7.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Edison)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon highIcon:(NSString *)highIcon target:(id)target action:(SEL)action;

@end
