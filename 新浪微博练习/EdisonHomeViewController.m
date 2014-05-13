//
//  EdisonHomeViewController.m
//  新浪微博练习
//
//  Created by Edison on 14-5-5.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonHomeViewController.h"
#import "UIBarButtonItem+Edison.h"
#import "AFNetworking.h"
#import "EdisonAccount.h"
#import "EdisonAccountTool.h"
#import "UIImageView+WebCache.h"
#import "EdisonStatus.h"
#import "EdisonUser.h"
#import "MJExtension.h"
#import "EdisonStatusFrame.h"
#import "EdisonStatusViewCell.h"
@interface EdisonHomeViewController ()
//statuses  statuse模型数组
@property (nonatomic,strong)NSArray *statusFrames;
@end

@implementation EdisonHomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupNavBar];
    //加载微博数据
    [self setupStatusData];
}

- (void)setupStatusData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //封装请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    EdisonAccount *account = [EdisonAccountTool account];
    parameters[@"access_token"] = account.access_token;
    
    [manager GET:@"https://api.weibo.com/2/statuses/home_timeline.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {//请求成功
        
        NSMutableArray *statusFrameArray = [NSMutableArray array];
        //字典数组转模型数组
        NSArray *statusArray = [EdisonStatus objectArrayWithKeyValuesArray:responseObject[@"statuses"]];
        //创建frame模型对象
        for (EdisonStatus *status in statusArray) {
            EdisonStatusFrame *statusFrame = [[EdisonStatusFrame alloc]init];
            // 传递微博模型数据
            statusFrame.status = status;
            [statusFrameArray addObject:statusFrame];
            
        }
        self.statusFrames = statusFrameArray;
        
        //刷新表格
        [self.tableView reloadData];
           } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

    }];
        
}
     
- (void)setupNavBar
{
    //左边的按钮
    self.navigationItem.leftBarButtonItem =  [UIBarButtonItem itemWithIcon:@"navigationbar_friendsearch" highIcon:@"navigationbar_friendsearch_highlighted" target:self action:@selector(find)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigationbar_pop" highIcon:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
}

- (void)find
{
    NSLog(@"find");
}
- (void)pop
{
    NSLog(@"pop");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.statusFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
  // 设置微博数据
    EdisonStatusViewCell *cell = [EdisonStatusViewCell cellWithTableView:tableView];
    cell.statusFrame = self.statusFrames[indexPath.row];
//   EdisonStatusFrame *statusFrame = self.statusFrames[indexPath.row];
//    EdisonStatus *status = statusFrame.status;
//    cell.textLabel.text = status.text;
//    EdisonUser *user = status.user;
//    cell.detailTextLabel.text = user.name;
//    //用第三方设置图片
//    NSString *urlStr = user.profile_image_url;
//    [cell.imageView setImageWithURL:[NSURL URLWithString:urlStr] placeholderImage:[UIImage imageWithName:@"tabbar_compose_button"]];
    return cell;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UIViewController *vc = [[UIViewController alloc]init];
//    vc.view.backgroundColor = [UIColor redColor];
//    
//    [self.navigationController pushViewController:vc animated:YES];
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EdisonStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    return statusFrame.cellHeight;
}


@end
