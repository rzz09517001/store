//
//  RZZRegisteNextViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZRegisteNextViewController.h"
#import "RZZVerificationView.h"

@interface RZZRegisteNextViewController ()

/**验证码页面*/
@property (nonatomic, strong) RZZVerificationView *verificationView;
@end

@implementation RZZRegisteNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = 0;
    self.title = @"验证手机号";
    [self.view addSubview:self.verificationView];
    __weak __typeof(self)weakSelf = self;
    [_verificationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(weakSelf.view);
    }];
    [self requestCodeNumber];
}

- (RZZVerificationView *)verificationView {
    if (!_verificationView) {
        _verificationView = [[RZZVerificationView alloc] init];
        _verificationView.phoneNum = self.dic[@"userName"];
        __weak __typeof(self)weakSelf = self;
        _verificationView.registeBlock = ^(NSString *code){
            RZZLog(@"注册按钮可以点击了,验证码是%@",code);
            [weakSelf regisiteMethod:code];
        };
    }
    return _verificationView;
}

/**
 请求验证码
 */
-(void)requestCodeNumber {
//    [self postData:@"appMember/creatCode.do" param:@{@"MemberID":_dic[@"telePhone"]} success:^(id  _Nonnull responseObject) {
//        if ([responseObject[@"result"] isEqualToString:@"success"]) {
//            [self.verificationView GCDTime];
//        } else if ([responseObject[@"result"] isEqualToString:@"TelephoneExistError"]) {
//
//        } else {
//            RZZLog(@"验证码请求失败");
//            [self showToast:@"验证码请求失败"];
//        }
//    } error:^(NSError * _Nonnull error) {
//        RZZLog(@"error--%@",error);
//    }];
    RZZLog(@"请求验证码触发了");
}


/**
 注册

 @param code 验证码
 */
- (void)regisiteMethod:(NSString *) code {
//    [self getData:@"appMember/appRegistration.do" param:@{@"LoginName":_dic[@"userName"],
//                                                                 @"Lpassword":_dic[@"password"],
//                                                                 @"Code":code,
//                                                                 @"Telephone":_dic[@"telePhone"]}
//                 success:^(id  _Nonnull responseObject) {
//                     if ([responseObject[@"result"] isEqualToString:@"success"]) {
//                         RZZLog(@"成功");
//                     } else if ([responseObject[@"result"] isEqualToString:@"codeError"]) {
//                         RZZLog(@"验证码错误");
//                         [self showToast:@"验证码错误"];
//                     } else {
//                         RZZLog(@"注册失败");
//                         [self showToast:@"注册失败"];
//                     }
//                 } error:^(NSError * _Nonnull error) {
//                     RZZLog(@"失败--%@",error);
//                     [self showToast:@"注册失败"];
//                     [self autoLogin];
//                 }];
    [self performSelector:@selector(autoLogin) withObject:nil afterDelay:1];
    [self showToastMessage:@"注册成功"];
}

-(void)autoLogin {    
//    [self postData:@"appMember/appLogin.do" param:@{@"LoginName":_dic[@"userName"],@"Lpassword":_dic[@"password"]}
//      success:^(id  _Nonnull responseObject) {
//          if ([responseObject[@"result"] isEqualToString:@"success"]) {
//              RZZLog(@"hahhahah");
//          }
//    } error:^(NSError * _Nonnull error) {
//        [self.navigationController popToRootViewControllerAnimated:YES];
//    }];
    NSDictionary *dic = @{@"MemberId":@"001",
                          @"MemberLvl":@"普通会员",
                          @"MemberName":@"user220131"
                          };
    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:@"userInfo"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
