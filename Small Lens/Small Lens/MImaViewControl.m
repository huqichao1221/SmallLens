//
//  MImaViewControl.m
//  xiaojingtou
//
//  Created by xzh on 15/8/10.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "MImaViewControl.h"
#import "Header.h"
#import "MBProgressHUD.h"
#import "HttpTool.h"
#import "IPAdress.h"
@interface MImaViewControl ()

@end

@implementation MImaViewControl

- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger n=54;
    NSInteger m=20;
    _mima=[[UITextField alloc]initWithFrame:CGRectMake(m, n+50, WIDTH-40, 40)];
    _mima.textAlignment=NSTextAlignmentCenter;
    _mima.borderStyle=UITextBorderStyleRoundedRect;
    [_mima setText:@"123456"];
    [self.view addSubview:_mima];
    _queren=[[UITextField alloc]initWithFrame:CGRectMake(m, n+120, WIDTH-40, 40)];
    _queren.textAlignment=NSTextAlignmentCenter;
    _queren.borderStyle=UITextBorderStyleRoundedRect;
    [_queren setText:@"455456"];
    [self.view addSubview:_queren];
    
    _button=[[UIButton alloc]initWithFrame:CGRectMake(m, n+200, WIDTH-40, 40)];
    [_button setTitle:@"完成" forState:UIControlStateNormal];
    _button.backgroundColor=[UIColor blueColor];
    [_button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    

}
-(NSString*)devieip
{
    InitAddresses();
    GetIPAddresses();
    GetHWAddresses();
    return [NSString stringWithFormat:@"%s",ip_names[1]];
    
}

-(void)next:(id)sender
{
    if ([_mima.text isEqualToString:_queren.text])
    {
        NSString * ip=[self devieip];
        NSString  * str11=[NSString stringWithFormat:@"%@",_queren.text];//密码文本
        NSString  * str22=[NSString stringWithFormat:@"%@",_MIobj.phonenumber];//手机号
        NSLog(@"%@",str11);
        NSLog(@"%@",str22);
        NSString  * str44=[NSString stringWithFormat:@"%@",@"543212"];
          NSDictionary * dic=@{@"UserPhoneNum":str22,@"ValiteCode":str44,@"User_OprateIP":ip};
        [HttpTool GET:QUERENZHUCE parm:dic success:^(id json) {
        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
            if([json[@"ErrCode"] isEqualToString:@"0"])
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"注册成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                
            }
            else if ([json[@"ErrCode"] isEqualToString:@"1"])
            {
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"注册失败，重新注册" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
            }
        } fail:^(NSError *error) {
            NSLog(@"%@",error);
            [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
        }];
        
        
    }
    else{
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"两次密码输入不相同，请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];

    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
