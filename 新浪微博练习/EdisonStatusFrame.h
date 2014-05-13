//
//  EdisonStatusFrame.h
//  新浪微博练习
//
//  Created by Edison on 14-5-12.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import <Foundation/Foundation.h>
#define EdisonStatusNameFont [UIFont systemFontOfSize:15]
#define EdisonStatusTimeFont [UIFont systemFontOfSize:12]
#define EdisonStatusSourceFont [UIFont systemFontOfSize:12]
#define EdisonStatusContentFont [UIFont systemFontOfSize:13]
@class EdisonStatus;
@interface EdisonStatusFrame : NSObject
@property (nonatomic,strong)EdisonStatus *status;
//顶部的view
@property (nonatomic,assign,readonly)CGRect topViewF;
//头像
@property (nonatomic,assign,readonly)CGRect iconViewF;
//vip图标
@property (nonatomic,assign,readonly)CGRect vipViewF;
//配图
@property (nonatomic,assign,readonly)CGRect photoViewF;
//昵称
@property (nonatomic,assign,readonly)CGRect nameLabelF;
//时间
@property (nonatomic,assign,readonly)CGRect timeLabelF;
//来源
@property (nonatomic,assign,readonly)CGRect sourceLabelF;
//微博内容
@property (nonatomic,assign,readonly)CGRect contentLabelF;
//被转发微博的view（父控件）
@property (nonatomic,assign,readonly)CGRect retweetViewF;
//被转发作者昵称
@property (nonatomic,assign,readonly)CGRect retweetNameLabelF;
//被转发微博内容
@property (nonatomic,assign,readonly)CGRect retweetContentLabelF;
//被转发配图
@property (nonatomic,assign,readonly)CGRect retweetPhotoViewF;
//微博工具条
@property (nonatomic,assign,readonly)CGRect statusToolBarF;
//cell高度
@property (nonatomic,assign,readonly)CGFloat cellHeight;
@end
