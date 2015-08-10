//
//  HttpTool.h
//  niuManager
//
//  Created by wenpeifang on 15/7/10.
//  Copyright (c) 2015年 wenpeifang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
+(void)GET:(NSString *)url parm:(NSDictionary *)dic success:(void(^)(id json))success fail:(void(^)(NSError *error)) fail;
+(void)POST:(NSString *)url parm:(NSDictionary *)dic success:(void(^)(id json))success fail:(void(^)(NSError *error)) fail;
@end
