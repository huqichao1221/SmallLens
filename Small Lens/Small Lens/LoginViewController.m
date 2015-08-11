//
//  LoginViewController.m
//  Small Lens
//
//  Created by zjm on 15-8-10.
//  Copyright (c) 2015年 zjm. All rights reserved.
//

#import "LoginViewController.h"
#import "HttpTool.h"
#import "General.h"
#import "MBProgressHUD+JM.h"
#import "LoginUser.h"
#import "SLTabBarController.h"
@interface LoginViewController ()
@property(nonatomic, weak) UIButton *loginBtn; // 登陆
@property(nonatomic, weak) UIButton *registBtn; // 注册
@property(nonatomic, weak) UIButton *forgetPwdBtn; // 忘记密码
@property(nonatomic, weak) UITextField *userName; // 用户名
@property(nonatomic, weak) UITextField *phoneNum; // 手机号
@property(nonatomic, weak) UITextField *passWord; // 密码



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR(233, 233, 233);
    self.navigationItem.title = @"登陆";
   
    // 初始化登陆界面
    [self setupInterface];
    
}

/**
 *  忘记密码
 */
- (void)forgetPwd{
    NSLog(@"forgetPwd");
}

/**
 *  注册
 */
- (void)regist{
    NSLog(@"register");
}

/**
 *  登陆成功
 */
- (void)loginSucess{
    SLTabBarController *slt = [[SLTabBarController alloc]init];
    [self.navigationController pushViewController:slt animated:NO];
}

/**
 *  登陆
 */
- (void)login{
    if([ self.phoneNum.text isEqualToString:@""] || [self.passWord.text isEqualToString:@""])
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSDictionary * dic = @{@"UserPhoneNum":self.phoneNum.text,@"Password":self.passWord.text,@"UserIP":@"192.168.1.1"}; // ,@"UserIP":
    [HttpTool GET:LOGIN parm:dic success:^(id json) {
       // [MBProgressHUD showMessage:@"正在加载"];
        if([json[@"Msg"] isEqualToString:@"用户手机号或者密码错误"])
        {
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:json[@"Msg"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alert show];
            return;
            
        }
        else if([json[@"Msg"] isEqualToString:@"登录成功"])
        {
                NSDictionary * dic = json[@"Item"];
                
                LoginUser *user = [LoginUser current];
                user.phoneNum = [NSString stringWithFormat:@"%@",dic[@"User_PhoneNum"]];
                user.pwd = [NSString stringWithFormat:@"%@",dic[@"User_Password"]];
                user.IP = [NSString stringWithFormat:@"%@",dic[@"User_OperaterIP"]];
                NSLog(@"%@", user.IP);
                user.ID = [NSString stringWithFormat:@"%@",dic[@"ID"]];
                
                [self loginSucess];
            
        }
    } fail:^(NSError *error) {
        NSLog(@"请求失败");
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    }];

}

/**
 *  初始化登陆界面
 */
- (void)setupInterface{
    CGFloat interval = 30; // 间隔
    // 地区
    UITextField *userName = [[UITextField alloc]init];
    userName.placeholder = @"地区";
    userName.borderStyle = UITextBorderStyleRoundedRect;
    CGFloat userNameW = WIDTH * 0.7;
    CGFloat userNameH = 40;
    CGFloat userNameX = (WIDTH - userNameW) * 0.5;
    CGFloat userNameY = 74;
    userName.frame = CGRectMake(userNameX, userNameY, userNameW, userNameH);
    [self.view addSubview:userName];
    self.userName = userName;
    
    // 输入手机号
    UITextField *phoneNum = [[UITextField alloc]init];
    phoneNum.placeholder = @"请输入手机号";
    phoneNum.borderStyle = UITextBorderStyleRoundedRect;
    CGFloat phoneNumY = userNameY + userNameH + interval;
    phoneNum.frame = CGRectMake(userNameX, phoneNumY, userNameW, userNameH);
    [self.view addSubview:phoneNum];
    self.phoneNum = phoneNum;
    
    // 密码
    UITextField *passWord = [[UITextField alloc]init];
    passWord.placeholder = @"请输入密码";
    passWord.borderStyle = UITextBorderStyleRoundedRect;
    CGFloat passWordY = phoneNumY + userNameH + interval;
    passWord.frame = CGRectMake(userNameX, passWordY, userNameW, userNameH);
    [self.view addSubview:passWord];
    self.passWord = passWord;
    
    // 登陆按钮
    UIButton *loginBtn = [[UIButton alloc]init];
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    CGFloat loginY = passWordY + userNameH + interval;
    loginBtn.frame = CGRectMake(userNameX, loginY, userNameW, userNameH);
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    // 注册账号按钮
    UIButton *registBtn = [[UIButton alloc]init];
    registBtn.backgroundColor = COLOR(233, 233, 233);
    [registBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [registBtn setTitleColor:[UIColor colorWithRed:78.0/255.0 green:78.0/255.0 blue:78.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    CGFloat registBtnW = 60;
    CGFloat registBtnH = 30;
    CGFloat registBtnX = (WIDTH - registBtnW * 2) * 0.5;
    CGFloat registBtnY = HEIGHT - registBtnH;
    registBtn.frame = CGRectMake(registBtnX, registBtnY, registBtnW, registBtnH);
    [registBtn addTarget:self action:@selector(regist) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    self.registBtn = registBtn;
    
    // 忘记密码按钮
    UIButton *forgetPwdBtn = [[UIButton alloc]init];
    forgetPwdBtn.backgroundColor = COLOR(233, 233, 233);
    [forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetPwdBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [forgetPwdBtn setTitleColor:[UIColor colorWithRed:78.0/255.0 green:78.0/255.0 blue:78.0/255.0 alpha:1.0] forState:UIControlStateNormal];
    CGFloat forgetPwdBtnW = registBtnW;
    CGFloat forgetPwdBtnH = registBtnH;
    CGFloat forgetPwdBtnX = registBtnX + registBtnW;
    CGFloat forgetPwdBtnY = registBtnY;
    forgetPwdBtn.frame = CGRectMake(forgetPwdBtnX, forgetPwdBtnY, forgetPwdBtnW, forgetPwdBtnH);
    [forgetPwdBtn addTarget:self action:@selector(forgetPwd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPwdBtn];
    self.forgetPwdBtn = forgetPwdBtn;
    
}


@end
