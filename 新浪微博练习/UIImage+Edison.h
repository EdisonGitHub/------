//
//  UIImage+Edison.h
//  新浪微博练习
//
//  Created by Edison on 14-5-5.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Edison)
+ (UIImage *)imageWithName:(NSString *)name;

//拉伸
+ (UIImage *)resizedImageWithName:(NSString *)name;
@end
