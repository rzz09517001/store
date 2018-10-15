//
//  RZZBaseViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZBaseViewController.h"
#import "RZZHTTPTool.h"
#import <SVProgressHUD.h>
#import "UIView+Toast.h"

@interface RZZBaseViewController ()

@end

@implementation RZZBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MainColor;
}

- (void)getData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock )success error:(requestErrorBlock )returnError {
    [SVProgressHUD show];
    [RZZHTTPTool getData:url param:dic success:^(id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        if (success) {
            success(responseObject);
        }
    } error:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (returnError) {
            [self showToastMessage:@"请求失败"];
            returnError(error);
        }
    }];
}

- (void)postData:(NSString *)url param:(NSDictionary *)dic success:(requestSuccessBlock )success error:(requestErrorBlock )returnError {
    [SVProgressHUD show];
    [RZZHTTPTool postData:url param:dic success:^(id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        if (success) {
            success(responseObject);
        }
    } error:^(NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        if (returnError) {
            [self showToastMessage:@"请求失败"];
            returnError(error);
        }
    }];
}

-(void)showToastMessage:(NSString *)message {
    [self.view makeToast:message duration:1.5 position:CSToastPositionCenter];
}
@end
