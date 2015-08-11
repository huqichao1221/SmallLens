//
//  YanZhengControlView.m
//  xiaojingtou
//
//  Created by xzh on 15/8/10.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "YanZhengControlView.h"
#import "Header.h"
#import "MImaViewControl.h"
#import "YanZhengControlView.h"
@implementation YanZhengControlView
- (void)viewDidLoad {
    [super viewDidLoad];
    NSInteger n=54;
    NSInteger m=20;
    _tishimessege=[[UILabel alloc]initWithFrame:CGRectMake(m, n, WIDTH-40, 40)];
    [_tishimessege setText:@"短信注册码已发到以下手机号码"];
    _tishimessege.numberOfLines=8;
    _tishimessege.textAlignment= NSTextAlignmentCenter;
    [_tishimessege setTextColor:[UIColor grayColor]];
    [self.view addSubview:_tishimessege];
    _shoujihao=[[UILabel alloc]initWithFrame:CGRectMake(m, n+30, WIDTH-40, 40)];
    NSString * str=[NSString stringWithFormat:@"%@",_obj.phonenumber];
    [_shoujihao setText:str];
    _shoujihao.numberOfLines=8;
    _shoujihao.textAlignment= NSTextAlignmentCenter;
    [_shoujihao setTextColor:[UIColor grayColor]];
    [self.view addSubview:_shoujihao];
    _yanzhengma=[[UITextField alloc]initWithFrame:CGRectMake(m, n+80, WIDTH-40, 40)];
    _yanzhengma.textAlignment=NSTextAlignmentCenter;
    _yanzhengma.borderStyle=UITextBorderStyleRoundedRect;
    NSString * str232=[NSString stringWithFormat:@"%@",_obj.yanzhennumber];
    [_yanzhengma setText:str232];
    [self.view addSubview:_yanzhengma];
    _queding=[[UIButton alloc]initWithFrame:CGRectMake(m, n+150, WIDTH-40, 40)];
    [_queding setTitle:@"下一步" forState:UIControlStateNormal];
    _queding.backgroundColor=[UIColor blueColor];
    [_queding addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_queding];
    NSLog(@"str%@",_obj.phonenumber);
    

}
-(void)next:(id)sender
{
    if ([_yanzhengma.text isEqualToString:_obj.yanzhennumber]) {
        _Yanobj=[[haomaobj alloc]init];
        _Yanobj.phonenumber=_obj.phonenumber;
        _Yanobj.yanzhennumber=_obj.yanzhennumber;
        MImaViewControl * Nvc=[[MImaViewControl alloc]init];
        Nvc.MIobj=_Yanobj;
        self.navigationItem.title=@"输入密码";
        [self.navigationController pushViewController:Nvc animated:NO];
    }
    else
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"验证码不正确，请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
