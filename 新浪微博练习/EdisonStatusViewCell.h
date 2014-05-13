//
//  EdisonStatusViewCell.h
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EdisonStatusFrame;
@interface EdisonStatusViewCell : UITableViewCell
@property (nonatomic,strong) EdisonStatusFrame *statusFrame;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
