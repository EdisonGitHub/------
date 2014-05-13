//
//  EdisonStatusViewCell.m
//  新浪微博练习
//
//  Created by Edison on 14-5-10.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonStatusViewCell.h"
#import "EdisonStatusFrame.h"
#import "EdisonUser.h"
#import "EdisonStatus.h"
#import "UIImageView+WebCache.h"
@interface EdisonStatusViewCell ()
//顶部的view
@property (nonatomic,weak)UIImageView *topView;
//头像
@property (nonatomic,weak)UIImageView *iconView;
//vip图标
@property (nonatomic,weak)UIImageView *vipView;
//配图
@property (nonatomic,weak)UIImageView *photoView;
//昵称
@property (nonatomic,weak)UILabel *nameLabel;
//时间
@property (nonatomic,weak)UILabel *timeLabel;
//来源
@property (nonatomic,weak)UILabel *sourceLabel;
//微博内容
@property (nonatomic,weak)UILabel *contentLabel;
//被转发微博的view（父控件）
@property (nonatomic,weak)UIImageView *retweetView;
//被转发作者昵称
@property (nonatomic,weak)UILabel *retweetNameLabel;
//被转发微博内容
@property (nonatomic,weak)UILabel *retweetContentLabel;
//被转发配图
@property (nonatomic,weak)UIImageView *retweetPhotoView;
//微博工具条
@property (nonatomic,weak)UIImageView *statusToolBar;
@end

@implementation EdisonStatusViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    EdisonStatusViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[EdisonStatusViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加原创微博
        [self setupOriginalSubviews];
        //添加被转发微博内部子控件
        [self setupRetweetSubviews];
        //添加微博工具条
        [self setupStatusToolBar];
        
    }
    return self;
}
//添加原创微博
- (void)setupOriginalSubviews
{
    //顶部的view
    UIImageView *topView = [[UIImageView alloc]init];
    [self.contentView addSubview:topView];
    self.topView = topView;
    //头像
    UIImageView *iconView = [[UIImageView alloc]init];
    [self.topView addSubview:iconView];
    self.iconView = iconView;
    //vip图标
    UIImageView *vipView = [[UIImageView alloc]init];
    [self.topView addSubview:vipView];
    self.vipView = vipView;
    //配图
    UIImageView *photoView = [[UIImageView alloc]init];
    [self.topView addSubview:photoView];
    self.photoView = photoView;
    
    //昵称
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = EdisonStatusNameFont;
    [self.topView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    //时间
    UILabel *timeLabel = [[UILabel alloc]init];
    timeLabel.font = EdisonStatusTimeFont;
    [self.topView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    //来源
    UILabel *sourceLabel = [[UILabel alloc]init];
    sourceLabel.font = EdisonStatusSourceFont;
    [self.topView addSubview:sourceLabel];
    self.sourceLabel = sourceLabel;
    //微博内容
    UILabel *contentLabel = [[UILabel alloc]init];
    contentLabel.numberOfLines = 0;
    contentLabel.font = EdisonStatusContentFont;
    [self.topView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
}
//添加被转发微博内部子控件
- (void)setupRetweetSubviews
{
    //被转发微博的view（父控件）
    UIImageView *retweetView = [[UIImageView alloc]init];
    [self.topView addSubview:retweetView];
    self.retweetView = retweetView;
    //被转发作者昵称
    UILabel *retweetNameLabel = [[UILabel alloc]init];
    [self.retweetView addSubview:retweetNameLabel];
    self.retweetNameLabel = retweetNameLabel;
   
    //被转发微博内容
    UILabel *retweetContentLabel = [[UILabel alloc]init];
    [self.retweetView addSubview:retweetContentLabel];
    self.retweetContentLabel = retweetContentLabel;
   
    //被转发配图
    UIImageView *retweetPhotoView = [[UIImageView alloc]init];
    [self.retweetView addSubview:retweetPhotoView];
    self.retweetPhotoView = retweetPhotoView;
    
}
//添加微博工具条
- (void)setupStatusToolBar
{
    
    UIImageView *statusToolBar = [[UIImageView alloc]init];
    [self.contentView addSubview:statusToolBar];
    self.statusToolBar = statusToolBar;
}

- (void)setStatusFrame:(EdisonStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    // 原创微博
    [self setupOriginalData];
    //转发微博
    [self setupRetweetData];
    
}
- (void)setupOriginalData
{
    EdisonStatus *status = self.statusFrame.status;
    EdisonUser *user = status.user;
    //顶部的view
    self.topView.frame = self.statusFrame.topViewF;
    
    //头像
    NSString *urlStr = user.profile_image_url;
    [self.iconView setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageWithName:@"avatar_default_small"]];
    self.iconView.frame = self.statusFrame.iconViewF;
    
    //vip图标
    if (user.isVip) {
      self.vipView.hidden = NO;
      self.vipView.frame = self.statusFrame.vipViewF;
        self.vipView.image = [UIImage imageWithName:@"common_icon_membership"];
    }else
    {
        self.vipView.hidden = YES;
    }
    
    
    //配图
    
    
    // @property (nonatomic,weak)UIImageView *photoView;
    //昵称
    self.nameLabel.text = user.name;
    self.nameLabel.frame = self.statusFrame.nameLabelF;
    
    //时间
    self.timeLabel.text = status.created_at;
    self.timeLabel.frame = self.statusFrame.timeLabelF;
    
    //来源
    self.sourceLabel.text = status.source;
    self.sourceLabel.frame = self.statusFrame.sourceLabelF;
    //微博内容
    self.contentLabel.text = status.text;
    self.contentLabel.frame = self.statusFrame.contentLabelF;
}
- (void)setupRetweetData
{
    
}


@end
