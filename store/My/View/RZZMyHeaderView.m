//
//  RZZMyHeaderView.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZMyHeaderView.h"

@interface RZZMyHeaderView()

/**顶部背景图片*/
@property (nonatomic, strong) UIImageView *headBackImage;
/**登录按钮*/
@property (nonatomic, strong) UIButton *loginBtn;
/**注册按钮*/
@property (nonatomic, strong) UIButton *registeBtn;
/**头像*/
@property (nonatomic, strong) UIImageView *iconImage;
/**用户名*/
@property (nonatomic, strong) UILabel *userNameLabel;
/**会员等级*/
@property (nonatomic, strong) UILabel *lvLabel;

@end

@implementation RZZMyHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headBackImage];
        [self addSubview:self.loginBtn];
        [self addSubview:self.registeBtn];
        [self addSubview:self.iconImage];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.lvLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof (self) weakSelf = self;
    [_headBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 40, 0));
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(-60);
        make.centerY.equalTo(weakSelf.headBackImage.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    [_registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(weakSelf.mas_centerX).offset(60);
        make.centerY.equalTo(weakSelf.headBackImage.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(45, 23));
    }];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(75, 75));
        make.centerY.equalTo(weakSelf.headBackImage.mas_centerY);
        make.left.equalTo(weakSelf.mas_left).offset(60 );
    }];
    [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(39);
        make.height.mas_equalTo(16);
        make.right.equalTo(weakSelf.mas_right);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(12);
    }];
    [_lvLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(39);
        make.height.mas_equalTo(16);
        make.right.equalTo(weakSelf.mas_right);
        make.bottom.equalTo(weakSelf.iconImage.mas_bottom).offset(-12);
    }];
}

-(UIImageView *)headBackImage
{
    if (!_headBackImage) {
        _headBackImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"我的背景"]];
    }
    return _headBackImage;
}

-(UIButton *)loginBtn
{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _loginBtn.titleLabel.textColor = [UIColor whiteColor];
        [_loginBtn addTarget:self action:@selector(pushLoginViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registeBtn
{
    if (!_registeBtn) {
        _registeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registeBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registeBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
        _registeBtn.titleLabel.textColor = [UIColor whiteColor];
        [_registeBtn addTarget:self action:@selector(pushRegisteViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registeBtn;
}

- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆界面微博登录"]];        
    }
    return _iconImage;
}

- (UILabel *)userNameLabel {
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
    }
    return _userNameLabel;
}

- (UILabel *)lvLabel {
    if (!_lvLabel) {
        _lvLabel = [[UILabel alloc] init];
    }
    return _lvLabel;
}
- (void)pushLoginViewController {
    if (_loginBlock) {
        _loginBlock();
    }
}

-(void)pushRegisteViewController {
    if (_registeBlock) {
        _registeBlock();
    }
}

- (void)reloadHederView {
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    if (dic.count) {
        self.loginBtn.hidden = YES;
        self.registeBtn.hidden = YES;
        self.iconImage.hidden = NO;
        self.userNameLabel.hidden = NO;
        self.userNameLabel.text = dic[@"MemberName"];
        self.lvLabel.hidden = NO;
        self.lvLabel.text = [NSString stringWithFormat:@"%@",dic[@"MemberLvl"]];
    } else {
        self.loginBtn.hidden = NO;
        self.registeBtn.hidden = NO;
        self.iconImage.hidden = YES;
        self.userNameLabel.hidden = YES;
        self.lvLabel.hidden = YES;
    }
}
@end
