//
//  UIImage+Edison.m
//  新浪微博练习
//
//  Created by Edison on 14-5-5.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "UIImage+Edison.h"

@implementation UIImage (Edison)
+ (UIImage *)imageWithName:(NSString *)name
{
    if (iOS7) {//如果是iOS7 就拼接
        NSString *newName = [name stringByAppendingString:@"_os7"];
        UIImage *image = [UIImage imageNamed:newName];
        if (image == nil) {
            image = [UIImage imageNamed:name];
        }
        return image;
    }
    return [UIImage imageNamed:name];
    
}
+ (UIImage *)resizedImageWithName:(NSString *)name
{
    UIImage *image = [self imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
@end
