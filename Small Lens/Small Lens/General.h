//
//  General.h
//  Small Lens
//
//  Created by zjm on 15-8-10.
//  Copyright (c) 2015年 zjm. All rights reserved.
//

#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#define HEIGHT  [UIScreen mainScreen].bounds.size.height - 64

#define API @"http://59.188.247.230:8082"

#define LOGIN API@"/XJT_User.asmx/User_Login" // 登陆