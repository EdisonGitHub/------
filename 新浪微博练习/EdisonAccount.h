//
//  EdisonAccount.h
//  新浪微博练习
//
//  Created by Edison on 14-5-8.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EdisonAccount : NSObject <NSCoding>
@property (nonatomic,copy)NSString *access_token;
@property (nonatomic,assign)long long expires_in;
@property (nonatomic,assign)long long remind_in;
@property (nonatomic,assign)long long uid;
//账号过期时间
@property (nonatomic,strong)NSDate *deadlineTime;
+ (instancetype)accountWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
