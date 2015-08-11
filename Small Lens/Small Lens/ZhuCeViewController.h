//
//  ZhuCeViewController.h
//  xiaojingtou
//
//  Created by xzh on 15/8/10.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhuCeViewController : UIViewController<UITextFieldDelegate,UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITextField * haoma;//手机号码
@property(nonatomic,strong)UITextField * yanzhengma;//
@property(nonatomic,strong)UIButton * queding;
@property(nonatomic,strong)UITableView * tableview;
@end
