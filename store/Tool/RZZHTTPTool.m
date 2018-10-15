//
//  RZZHTTPTool.m
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZHTTPTool.h"

@implementation RZZHTTPTool

+ (instancetype) shareManager {
    static RZZHTTPTool *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[RZZHTTPTool alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"multipart/form-data",@"text/plain", nil];
        manager.requestSerializer.cachePolicy = NSURLRequestUseProtocolCachePolicy;
        [manager.requestSerializer setValue:@"OSChina.NET/3.7.3/iPhone OS/8.4.1/iPhone/8F924653-03E4-4982-AB4B-0D242DB6622B" forHTTPHeaderField:@"User-Agent"];
        //设置https非校验证书模式,不然https请求不成功
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        manager.securityPolicy.allowInvalidCertificates = YES;
        [manager.securityPolicy setValidatesDomainName:NO];
    });
    return manager;
}

+ (void)getData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock)success error:(requestErrorBlock)returnError {
    [[RZZHTTPTool shareManager] GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (returnError) {
            returnError(error);
        }
    }];
}

+ (void)postData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock)success error:(requestErrorBlock)returnError {
    [[RZZHTTPTool shareManager] POST:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (returnError) {
            returnError(error);
        }
    }];
}
@end
