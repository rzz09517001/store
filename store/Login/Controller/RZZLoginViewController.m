//
//  RZZLoginViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZLoginViewController.h"
#import "RZZLoginHederView.h"
#import "RZZThirdLoginView.h"
#import <UMShare/UMShare.h>
#import "RZZRegisteNextViewController.h"
#import "RZZRegisteViewController.h"

@interface RZZLoginViewController ()

/**输入项View*/
@property (nonatomic, strong) RZZLoginHederView *headerView;
/**第三方登录页面*/
@property (nonatomic, strong) RZZThirdLoginView *thirdLoginView;

@end

@implementation RZZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.thirdLoginView];
    __weak __typeof(self)weakSelf = self;
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@230);
    }];
    [_thirdLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headerView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.equalTo(@85);
    }];
}

- (RZZLoginHederView *)headerView {
    if (!_headerView) {
        _headerView = [[RZZLoginHederView alloc] init];
        __weak __typeof(self)weakSelf = self;
        _headerView.registeBlock = ^{
            RZZRegisteViewController *registeViewController = [[RZZRegisteViewController alloc] init];
            [weakSelf.navigationController pushViewController:registeViewController animated:YES];
        };
        _headerView.loginBlock = ^(NSDictionary * _Nonnull dict) {
            [weakSelf loginMethod:dict];
        };
    }
    return _headerView;
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

-(void)loginMethod:(NSDictionary *) dic {
//    [self postData:@"appMember/appLogin.do" param:dic success:^(id  _Nonnull responseObject) {
//
//    } error:^(NSError * _Nonnull error) {
//
//    }];
    RZZLog(@"点击了登录按钮");
    NSDictionary *diction = @{@"MemberId":@"001",
                          @"MemberLvl":@"普通会员",
                          @"MemberName":@"user220131"
                          };
    [[NSUserDefaults standardUserDefaults] setObject:diction forKey:@"userInfo"];
    [self showToastMessage:@"登录成功"];
    [self performSelector:@selector(popMyViewController) withObject:nil afterDelay:1];
}

- (void)popMyViewController {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
/**
 QQ登录
 */
- (void)getAuthWithUserInfoFromQQ
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_QQ currentViewController:nil completion:^(id result, NSError *error) {
        if (error) {
        } else {
            UMSocialUserInfoResponse *resp = result;
            RZZLog(@"%@",result);
            RZZRegisteNextViewController *nextViewController = [[RZZRegisteNextViewController alloc] init];
            //nextViewController.dic = dic;
            nextViewController.dic = @{@"userName":resp.name,@"iconImage":resp.iconurl,@"telePhone":@"18682296282",@"password":@"123123"};
            [self.navigationController pushViewController:nextViewController animated:YES];
        }
    }];
}

@end
