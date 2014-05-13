//
//  EdisonStatusFrame.m
//  新浪微博练习
//
//  Created by Edison on 14-5-12.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonStatusFrame.h"
#import "EdisonStatus.h"
#import "EdisonUser.h"
//cell边框宽度
#define  EdisonStatusCellBorder 5

@implementation EdisonStatusFrame
- (void)setStatus:(EdisonStatus *)status
{
    _status = status;
    //cell宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    //topView
    CGFloat topViewX = 0;
    CGFloat topViewY = 0;
    CGFloat topViewW = cellW;
//    CGFloat topViewH = ;
//    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    //头像
    CGFloat iconViewX = EdisonStatusCellBorder;
    CGFloat iconViewY = EdisonStatusCellBorder;
    CGFloat iconViewWH = 35;
    _iconViewF = CGRectMake(iconViewX, iconViewY, iconViewWH, iconViewWH);
    //昵称
    CGFloat nameLabelX = CGRectGetMaxX(_iconViewF) + EdisonStatusCellBorder;
    CGFloat nameLabelY = iconViewY;
    CGSize nameLabelSize = [status.user.name sizeWithFont:EdisonStatusNameFont];
    CGFloat nameLabelW = nameLabelSize.width;
    CGFloat nameLabelH = nameLabelSize.height;
    _nameLabelF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    //会员
    if (status.user.isVip) {
        CGFloat vipViewX = CGRectGetMaxX(_nameLabelF) + EdisonStatusCellBorder;
        CGFloat vipViewY = nameLabelY;
        CGFloat vipViewW = 14;
        CGFloat vipViewH = nameLabelH;
        _vipViewF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
       
    }
    //时间
    CGFloat timeLabelX = nameLabelX;
    CGFloat timeLabelY = CGRectGetMaxY(_nameLabelF) + EdisonStatusCellBorder;
    CGSize timeLabelSize = [status.created_at sizeWithFont:EdisonStatusTimeFont];
    CGFloat timeLabelW = timeLabelSize.width;
    CGFloat timeLabelH = timeLabelSize.height;
    _timeLabelF = CGRectMake(timeLabelX, timeLabelY, timeLabelW, timeLabelH);
    
    //来源
    CGFloat sourceLabelX = CGRectGetMaxX(_timeLabelF) +EdisonStatusCellBorder;
    CGFloat sourceLabelY = timeLabelY;
    CGSize sourceLabelSize = [status.source sizeWithFont:EdisonStatusSourceFont];
    CGFloat sourceLabelW = sourceLabelSize.width;
    CGFloat sourceLabelH = sourceLabelSize.height;
    _sourceLabelF = CGRectMake(sourceLabelX, sourceLabelY, sourceLabelW,sourceLabelH);
    //微博内容
    CGFloat contentLabelX = iconViewX;
    CGFloat contentLabelY = MAX(CGRectGetMaxY(_iconViewF), CGRectGetMaxY(_timeLabelF)) + EdisonStatusCellBorder;
    CGFloat contentLabelW = topViewW - 2 * EdisonStatusCellBorder;
    CGSize contentLabelSize = [status.text sizeWithFont:EdisonStatusContentFont constrainedToSize:CGSizeMake(contentLabelW, MAXFLOAT)];
    CGFloat contentLabelH = contentLabelSize.height;
    _contentLabelF = CGRectMake(contentLabelX, contentLabelY, contentLabelW,contentLabelH);
    //topView的高度
    CGFloat topViewH = CGRectGetMaxY(_contentLabelF) + EdisonStatusCellBorder;
    _topViewF = CGRectMake(topViewX, topViewY, topViewW, topViewH);
    //cell高度
    _cellHeight = topViewH;
}
@end
