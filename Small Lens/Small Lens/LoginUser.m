//
//  LoginUser.m
//  niuManager
//
//  Created by HELLO  on 15/7/13.
//  Copyright (c) 2015年 wenpeifang. All rights reserved.
//

#import "LoginUser.h"
#import "SFHFKeychainUtils.h"

#define NIUUSERNAME @"com.jianzhikun.niumanager_username"


#define NIUPASSWORD @"com.jianzhikun.niumanager_password"
#define NIUSERVERNAME @"com.jianzhikun.niumanager.service"
static LoginUser * user = nil;
@implementation LoginUser

+(LoginUser *)current
{
    if(user ==nil)
    {
        user = [[LoginUser alloc]init];
    }
    return user;
}
-(void)getUserName
{
    NSString * user = [SFHFKeychainUtils getPasswordForUsername:NIUUSERNAME andServiceName:NIUSERVERNAME error:nil];
    NSString * pwd = [SFHFKeychainUtils getPasswordForUsername:NIUPASSWORD andServiceName:NIUSERVERNAME error:nil];
    self.phoneNum = user;
    self.pwd = pwd;
}
-(void)saveUsername:(NSString *)userName pwd:(NSString *)pwd
{
    [SFHFKeychainUtils storeUsername:NIUUSERNAME andPassword:userName forServiceName:NIUSERVERNAME updateExisting:YES error:nil];
    [SFHFKeychainUtils storeUsername:NIUPASSWORD andPassword:pwd forServiceName:NIUSERVERNAME updateExisting:YES error:nil];
}
@end
