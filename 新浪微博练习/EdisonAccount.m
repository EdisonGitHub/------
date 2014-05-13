//
//  EdisonAccount.m
//  新浪微博练习
//
//  Created by Edison on 14-5-8.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonAccount.h"

@implementation EdisonAccount
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
//将对象写入文件调用
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.access_token forKey:@"access_token"];
    [aCoder encodeInt64:self.expires_in forKey:@"expires_in"];
    [aCoder encodeInt64:self.remind_in forKey:@"remind_in"];
    [aCoder encodeInt64:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.deadlineTime forKey:@"deadlineTime"];
}
//从文件中解析中调用
- (id)initWithCoder:(NSCoder *)aDecoder//构造方法
{
    if (self = [super init]) {
        self.access_token = [aDecoder decodeObjectForKey:@"access_token"];
        self.expires_in = [aDecoder decodeInt64ForKey:@"expires_in"];
        self.remind_in = [aDecoder decodeInt64ForKey:@"remind_in"];
        self.uid = [aDecoder decodeInt64ForKey:@"uid"];
        self.deadlineTime = [aDecoder decodeObjectForKey:@"deadlineTime"];
        
        
    }
    return self;
}
@end
