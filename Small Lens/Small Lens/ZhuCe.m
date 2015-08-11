//
//  ZhuCe.m
//  xiaojingtou
//
//  Created by xzh on 15/8/10.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "ZhuCe.h"

@implementation ZhuCe
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _guojia=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        [_guojia setText:@"国家/地区"];
        [self.contentView addSubview:_guojia];
        _address=[[UILabel alloc]initWithFrame:CGRectMake(250, 0, 100, 40)];
        [_address setText:@"中国"];
        _address.textColor=[UIColor greenColor];
        [self.contentView addSubview:_address];
    }
    return self;
}
@end
