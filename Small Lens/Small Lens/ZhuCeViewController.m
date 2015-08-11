//
//  ZhuCeViewController.m
//  xiaojingtou
//
//  Created by xzh on 15/8/10.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "Header.h"
#import "ZhuCe.h"
#import "MBProgressHUD.h"
#import "HttpTool.h"
#import "YanZhengControlView.h"
#import "haomaobj.h"
#import "IPAdress.h"

 
@interface ZhuCeViewController ()
@property(nonatomic,strong)NSArray * yanzhen;
@property(nonatomic,strong)NSMutableString * changstring;
@property(nonatomic,strong)NSString * pistr;
@property(nonatomic,strong)NSString * ipstr;
@end

@implementation ZhuCeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
   ;
    _pistr=[[NSString alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(20, 10, WIDTH-40,110) style:UITableViewStylePlain];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=[UIColor whiteColor];
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableview.bounces=NO;
    [self.view addSubview:_tableview];
    //号码文本框
    _haoma=[[UITextField alloc]initWithFrame:CGRectMake(20, 130, WIDTH-40, 40)];
    _haoma.placeholder=@"请输入手机号码";
    _haoma.delegate=self;
    _haoma.clearsOnBeginEditing=YES;
    _haoma.borderStyle=UITextBorderStyleRoundedRect;
   // [_haoma setBackgroundColor:[UIColor redColor]];
    //下一步按钮
    _queding=[[UIButton alloc]initWithFrame:CGRectMake(20, 200, WIDTH-40, 40)];
    [_queding setTitle:@"下一步" forState:UIControlStateNormal];
    _queding.backgroundColor=[UIColor blueColor];
    [_queding addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_queding];
    [self.view addSubview:_haoma];
    NSString * ip=[self devieip];
    _ipstr=[[NSString alloc]initWithFormat:@"%@",ip];
    
}

//下一步按钮
-(NSString*)devieip
{
    InitAddresses();
    GetIPAddresses();
    GetHWAddresses();
    return [NSString stringWithFormat:@"%s",ip_names[1]];
    
}
-(void)next:(id)sender
{
    
    NSString *indentifier=[[[UIDevice currentDevice] identifierForVendor]UUIDString];
    //设备号
    NSLog(@"22222222%@",indentifier);
     // 输出设备id

    if (_haoma.text.length==0) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"输入号码不能为空，请输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];

    }
    else if (_haoma.text.length<11 ||  _haoma.text.length>11)
    {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"手机号码位数,不正确请重新输入" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    { NSString * ip=[self devieip];
         //获取ip
        NSString  * str22=[NSString stringWithFormat:@"%@",_haoma.text];
        NSLog(@"%@",str22);
        NSString  * str32=[NSString stringWithFormat:@"%@",@"12354"];
        NSDictionary * dic=@{@"UserPhoneNum":str22,@"User_OprateIP":_ipstr};
        NSLog(@"dic%@",dic);
        NSLog(@"ip%@",_ipstr);
        //验证码
       
        NSString *strRandom = @"";
        for(int i=0; i<6; i++)
        {
            strRandom = [ strRandom stringByAppendingFormat:@"%i",(arc4random() % 9)];
           
        }
       
                [HttpTool GET:ZHUCE parm:dic success:^(id json) {
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                   if([json[@"ErrCode"] isEqualToString:@"0"])
                    {
                        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];
                        YanZhengControlView * Ycc=[[YanZhengControlView alloc]init];
                        self.navigationItem.title=@"返回";
                        haomaobj * obj=[[haomaobj alloc]init];
                        Ycc.obj=obj;
                        obj.phonenumber=str22;
                        obj.yanzhennumber=strRandom;
                        NSLog(@"%@",obj.yanzhennumber);
                       [self.navigationController pushViewController:Ycc animated:YES];
                    }
                    else if ([json[@"ErrCode"] isEqualToString:@"1"])
                    {
                        
                        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"该用户已注册，可以直接登录" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                        [alert show];

                    }
        
                } fail:^(NSError *error) {
                    NSLog(@"%@",error);
                    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
                }];
        
            }
    }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    ZhuCe * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil)
    {
        cell = [[ZhuCe alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;//_AllDownLoad.count
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
