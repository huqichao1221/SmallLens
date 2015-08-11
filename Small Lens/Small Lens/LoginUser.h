//
//  LoginUser.h
//  niuManager
//
//  Created by HELLO  on 15/7/13.
//  Copyright (c) 2015年 wenpeifang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUser : NSObject

@property (nonatomic,strong) NSString *ID; // 用户ID
@property (nonatomic,strong) NSString *phoneNum; // 用户手机号
@property (nonatomic,strong) NSString *pwd; // 用户密码
@property (nonatomic,strong) NSString *IP; // 用户IP

+(LoginUser *)current;
-(void)getUserName;
-(void)saveUsername:(NSString *)userName pwd:(NSString *)pwd;
@end
