//
//  LoginViewController.m
//  Small Lens
//
//  Created by zjm on 15-8-10.
//  Copyright (c) 2015年 zjm. All rights reserved.
//

#import "LoginViewController.h"
#import "General.h"
#import "MBProgressHUD+JM.h"
@interface LoginViewController ()
@property(nonatomic, weak) UIButton *loginBtn; // 登陆
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
    
    
}


/**
 *  登陆成功
 */
- (void)loginSucess{
    
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
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
//    NSDictionary * dic = @{@"staff_name":_userNameField.text,@"staff_pwd":_passwordField.text};
//    [HttpTool GET:LOGINURL parm:dic success:^(id json) {
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//        if([json[@"status"] isEqualToString:@"error"])
//        {
//            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:json[@"message"] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
//            [alert show];
//            return;
//            
//        }
//        else if([json[@"status"] isEqualToString:@"ok"])
//        {
//            NSArray * arr = json[@"data"];
//            if([arr count]>0)
//            {
//                NSDictionary * dic = arr[0];
//                
//                LoginUser * user = [LoginUser current];
//                user.staff_isauth = [NSString stringWithFormat:@"%@",dic[@"staff_isauth"]];
//                user.staff_name = [NSString stringWithFormat:@"%@",dic[@"staff_name"]];
//                user.store_id = [NSString stringWithFormat:@"%@",dic[@"store_id"]];
//                user.store_address = [NSString stringWithFormat:@"%@",dic[@"store_address"]];
//                user.store_name = [NSString stringWithFormat:@"%@",dic[@"store_name"]];
//                
//                user.findkh = [[NSString stringWithFormat:@"%@",dic[@"findkh"]] integerValue];
//                user.addkh = [[NSString stringWithFormat:@"%@",dic[@"addkh"]] integerValue];
//                user.delkh = [[NSString stringWithFormat:@"%@",dic[@"delkh"]] integerValue];
//                user.savekh = [[NSString stringWithFormat:@"%@",dic[@"savekh"]] integerValue];
//                user.findyg = [[NSString stringWithFormat:@"%@",dic[@"findyg"]] integerValue];
//                user.addyg = [[NSString stringWithFormat:@"%@",dic[@"addyg"]] integerValue];
//                user.delyg = [[NSString stringWithFormat:@"%@",dic[@"delyg"]] integerValue];
//                user.saveyg = [[NSString stringWithFormat:@"%@",dic[@"saveyg"]] integerValue];
//                user.findxm = [[NSString stringWithFormat:@"%@",dic[@"findxm"]] integerValue];
//                user.addxm = [[NSString stringWithFormat:@"%@",dic[@"addxm"]] integerValue];
//                user.delxm = [[NSString stringWithFormat:@"%@",dic[@"delxm"]] integerValue];
//                user.savexm = [[NSString stringWithFormat:@"%@",dic[@"savexm"]] integerValue];
//                user.findcp = [[NSString stringWithFormat:@"%@",dic[@"findcp"]] integerValue];
//                user.addcp = [[NSString stringWithFormat:@"%@",dic[@"addcp"]] integerValue];
//                user.delcp = [[NSString stringWithFormat:@"%@",dic[@"delcp"]] integerValue];
//                user.savecp = [[NSString stringWithFormat:@"%@",dic[@"savecp"]] integerValue];
//                
//                [self loginSucess];
//            }
//        }
//    } fail:^(NSError *error) {
//        NSLog(@"请求失败");
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//    }];

}
@end
