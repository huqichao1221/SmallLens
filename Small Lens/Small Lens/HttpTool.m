//
//  HttpTool.m
//  niuManager
//
//  Created by wenpeifang on 15/7/10.
//  Copyright (c) 2015年 wenpeifang. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"
@implementation HttpTool
+(void)GET:(NSString *)url parm:(NSDictionary *)dic success:(void(^)(id json))success fail:(void(^)(NSError *error)) fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer =  [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        id json =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(json);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];

}
+(void)POST:(NSString *)url parm:(NSDictionary *)dic success:(void(^)(id json))success fail:(void(^)(NSError *error)) fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer =  [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:url parameters:dic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        id json =  [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        success(json);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
    }];
}
@end
