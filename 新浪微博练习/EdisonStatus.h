//
//  EdisonStatus.h
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EdisonUser;
@interface EdisonStatus : NSObject
//内容
@property (nonatomic,copy)NSString *text;
//来源
@property (nonatomic,copy)NSString *source;
//微博ID
@property (nonatomic,copy)NSString * idstr;
//微博创建时间
@property (nonatomic,copy)NSString *created_at;
//转发数
@property (nonatomic,assign)int respost_count;
//赞
@property (nonatomic,assign)int attitudes_count;
//评论数
@property (nonatomic,assign)int comments_count;
//微博单张配图
@property (nonatomic,copy)NSString *thumbnail_pic;
//user模型
@property (nonatomic,strong)EdisonUser *user;
//被转发微博
@property (nonatomic,strong)EdisonStatus *retweeted_status;


@end
