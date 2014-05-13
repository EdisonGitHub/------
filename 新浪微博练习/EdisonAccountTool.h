//
//  EdisonAccountTool.h
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EdisonAccount.h"
@interface EdisonAccountTool : NSObject
//存入
+ (void)saveAccount:(EdisonAccount *)account;
//读取
+ (EdisonAccount *)account;
@end
