//
//  IPAdress.h
//  Small Lens
//
//  Created by xzh on 15/8/11.
//  Copyright (c) 2015年 zjm. All rights reserved.
//

#ifndef Small_Lens_IPAdress_h
#define Small_Lens_IPAdress_h
#define MAXADDRS 32
extern char *if_names[MAXADDRS];
extern char *ip_names[MAXADDRS];
extern char *hw_addrs[MAXADDRS];
extern unsigned long ip_addrs[MAXADDRS];
void InitAddresses();
void FreeAddresses();
void GetIPAddresses();
void GetHWAddresses();

#endif
