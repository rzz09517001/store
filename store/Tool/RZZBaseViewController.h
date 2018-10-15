//
//  RZZBaseViewController.h
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^requestSuccessBlock)(id responseObject);
typedef void (^requestErrorBlock)(NSError *error);

@interface RZZBaseViewController : UIViewController

//get请求
- (void)getData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock )success error:(requestErrorBlock )returnError;
//post请求
- (void)postData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock )success error:(requestErrorBlock )returnError;
//提示信息
- (void)showToastMessage:(NSString *) message;

@end

NS_ASSUME_NONNULL_END
