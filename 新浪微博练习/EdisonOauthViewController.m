//
//  EdisonOauthViewController.m
//  新浪微博练习
//
//  Created by Edison on 14-5-8.
//  Copyright (c) 2014年 Edison. All rights reserved.
//

#import "EdisonOauthViewController.h"
#import "AFNetworking.h"
#import "EdisonAccount.h"
#import "EdisonTabBarViewController.h"
#import "EdisonWeiboTool.h"
#import "EdisonAccountTool.h"
#import "MBProgressHUD+MJ.h"
@interface EdisonOauthViewController ()<UIWebViewDelegate>

@end

@implementation EdisonOauthViewController


- (void)viewDidLoad
{
    //添加webView
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]init];
    webView.frame = self.view.frame;
    webView.delegate = self;
    [self.view addSubview:webView];
    //加载授权页面
    NSURL *url = [NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3459463157&redirect_uri=http://www.baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
}



#pragma mark - webView代理方法
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    //现实提醒
    [MBProgressHUD showMessage:@"正在加载中。。"];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    //隐藏提醒
    [MBProgressHUD hideHUD];
}



//发送请求前调用这个方法 (可不可以加载这个页面)
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   
    //请求url路径
    NSString *urlStr = request.URL.absoluteString;
    //查找code的range
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.location != NSNotFound) {
        //截取code后面的
      NSString *code = [urlStr substringFromIndex:range.location + range.length];
        //发送post请求给新浪,还accessToken
        [self accessTokenWithCode:code];
    }
    
    return YES;
}
/*
 
 client_id	true	string	申请应用时分配的AppKey。
 client_secret	true	string	申请应用时分配的AppSecret。
 grant_type	true	string	请求的类型，填写authorization_code
 
 grant_type为authorization_code时
 必选	类型及范围	说明
 code	true	string	调用authorize获得的code值。
 redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
 
 */
- (void)accessTokenWithCode:(NSString *)code
{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //封装请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"client_id"] = @"3459463157";
    parameters[@"client_secret"] = @"98778e05f9fe7368116d7e1460f27b04" ;
    parameters[@"grant_type"] = @"authorization_code";
    parameters[@"code"] = code;
    parameters[@"redirect_uri"] = @"http://www.baidu.com";
    
    [manager POST:@"https://api.weibo.com/oauth2/access_token" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {//请求成功
        //将字典转模型
        EdisonAccount *account = [EdisonAccount accountWithDict:responseObject];
       //存储模型数据(服务器返回来的)
        [EdisonAccountTool saveAccount:account];
        
        //新特性或者首页
        [EdisonWeiboTool chooseRootController];
        //去掉隐藏
        [MBProgressHUD hideHUD];
        }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       
    }];

}

@end
