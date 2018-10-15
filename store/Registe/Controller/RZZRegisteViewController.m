//
//  RZZRegisteViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZRegisteViewController.h"
#import "RZZRegisteInPutView.h"
#import "RZZThirdLoginView.h"
#import "RZZRegisteNextViewController.h"
#import <UMShare/UMShare.h>

@interface RZZRegisteViewController ()

/**输入项View*/
@property (nonatomic, strong) RZZRegisteInPutView *inputView;
/**第三方登录页面*/
@property (nonatomic, strong) RZZThirdLoginView *thirdLoginView;

@end

@implementation RZZRegisteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = MainColor;
    self.title = @"注册";
    //布局从navbar之下，tabbar之上
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.inputView];
    [self.view addSubview:self.thirdLoginView];
    __weak __typeof(self)weakSelf = self;
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@230);
    }];
    [_thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.inputView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@85);
    }];
}

- (RZZRegisteInPutView *)inputView {
    if (!_inputView) {
        _inputView = [[RZZRegisteInPutView alloc] init];
        __weak __typeof(self)weakSelf = self;
        _inputView.nextBlock = ^(NSDictionary *dic){
            RZZRegisteNextViewController *nextViewController = [[RZZRegisteNextViewController alloc] init];
            nextViewController.dic = dic;
            [weakSelf.navigationController pushViewController:nextViewController animated:YES];
        };
    }
    return _inputView;
}

- (RZZThirdLoginView *)thirdLoginView {
    if (!_thirdLoginView) {
        _thirdLoginView = [[RZZThirdLoginView alloc] init];
        __weak __typeof(self)weakSelf = self;
        _thirdLoginView.qqBlock = ^{
            [weakSelf getAuthWithUserInfoFromQQ];
        };
    }
    return _thirdLoginView;
}

- (void)getAuthWithUserInfoFromQQ
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
        } else {
            UMSocialUserInfoResponse *resp = result;
            // 授权信息
            NSLog(@"QQ uid: %@", resp.uid);
            NSLog(@"QQ openid: %@", resp.openid);
            NSLog(@"QQ unionid: %@", resp.unionId);
            NSLog(@"QQ accessToken: %@", resp.accessToken);
            NSLog(@"QQ expiration: %@", resp.expiration);
            // 用户信息
            NSLog(@"QQ name: %@", resp.name);
            NSLog(@"QQ iconurl: %@", resp.iconurl);
            NSLog(@"QQ gender: %@", resp.unionGender);
            // 第三方平台SDK源数据
            NSLog(@"QQ originalResponse: %@", resp.originalResponse);
            RZZRegisteNextViewController *nextViewController = [[RZZRegisteNextViewController alloc] init];
            //nextViewController.dic = dic;
            nextViewController.dic = @{@"userName":resp.name,@"iconImage":resp.iconurl,@"telePhone":@"18682296282",@"password":@"123123"};
            [self.navigationController pushViewController:nextViewController animated:YES];
        }
    }];
}

@end
