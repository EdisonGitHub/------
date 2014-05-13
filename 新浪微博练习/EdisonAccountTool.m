//
//  EdisonAccountTool.m
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonAccountTool.h"
#import "EdisonAccount.h"
#define EdisonAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"accountdata.plist"]
@implementation EdisonAccountTool
+ (void)saveAccount:(EdisonAccount *)account
{
    //计算过期时间
    NSDate *now = [NSDate date];
    account.deadlineTime = [now dateByAddingTimeInterval:account.remind_in];
    //NSLog(@"%@",account.deadlineTime);
    
    //写入
    [NSKeyedArchiver archiveRootObject:account toFile:EdisonAccountFile];
}
+ (EdisonAccount *)account
{
    //读取
    EdisonAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:EdisonAccountFile];
    NSDate *now = [NSDate date];
    //NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
    if ([now compare:account.deadlineTime] == NSOrderedAscending) {//没过期
        //NSLog(@"%@",account.deadlineTime);
       
         return account;
    }else
    {
        return nil;
    }
    
}
@end
