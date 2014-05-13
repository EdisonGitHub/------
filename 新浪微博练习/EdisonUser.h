//
//  EdisonUser.h
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EdisonUser : NSObject
//用户的id
@property (nonatomic,copy)NSString * idstr;
//用户的昵称
@property (nonatomic,copy)NSString *name;
//用户的头像
@property (nonatomic,copy)NSString *profile_image_url;
//是否为VIP
@property (nonatomic,assign,getter = isVip )BOOL vip;

@end
