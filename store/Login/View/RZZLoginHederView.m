//
//  RZZLoginHederView.m
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZLoginHederView.h"

@interface RZZLoginHederView()<UITextFieldDelegate>

/**用户名*/
@property (nonatomic, strong) UITextField *userNameText;
/**密码*/
@property (nonatomic, strong) UITextField *passWordText;
/**登录*/
@property (nonatomic, strong) UIButton *loginBtn;
/**去注册*/
@property (nonatomic, strong) UIButton *goRegisteBtn;
/**输入框背景色*/
@property (nonatomic, strong) UILabel *textBackLabel;
/**输入框中间线*/
@property (nonatomic, strong) UILabel *textLineLabel;

@end

@implementation RZZLoginHederView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textBackLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.passWordText];
        [self addSubview:self.textLineLabel];
        [self addSubview:self.loginBtn];
        [self addSubview:self.goRegisteBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof(self)weakSelf = self;
    [_textBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@88);
        make.left.equalTo(weakSelf.mas_top).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.top.equalTo(weakSelf.mas_top).offset(15);
    }];
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.textBackLabel.mas_top);
    }];
    [_passWordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.userNameText.mas_bottom);
    }];
    [_textLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(weakSelf.textBackLabel.mas_left).offset(15);
        make.right.equalTo(weakSelf.textBackLabel.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.textBackLabel.mas_centerY);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@35);
        make.top.equalTo(weakSelf.passWordText.mas_bottom).offset(15);
    }];
    [_goRegisteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(90, 16));
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.loginBtn.mas_bottom).offset(23);
    }];
}


- (UILabel *)textBackLabel {
    if(!_textBackLabel) {
        _textBackLabel = [[UILabel alloc] init];
        _textBackLabel.backgroundColor = [UIColor whiteColor];
        _textBackLabel.layer.borderWidth = 1;
        _textBackLabel.layer.borderColor = RGB(188, 188, 188).CGColor;
    }
    return _textBackLabel;
}

- (UITextField *)userNameText {
    if (!_userNameText) {
        _userNameText = [[UITextField alloc] init];
        _userNameText.delegate = self;
        _userNameText.placeholder = @"请输入手机号码";
        [_userNameText addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _userNameText;
}

- (UITextField *)passWordText {
    if (!_passWordText) {
        _passWordText = [[UITextField alloc] init];
        _passWordText.delegate = self;
        _passWordText.placeholder = @"请输入密码";
        [_passWordText addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    }
    return _passWordText;
}

- (UILabel *)textLineLabel {
    if (!_textLineLabel) {
        _textLineLabel = [[UILabel alloc] init];
        _textLineLabel.backgroundColor = RGB(188, 188, 188);
    }
    return _textLineLabel;
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        _loginBtn.userInteractionEnabled = NO;
        _loginBtn.backgroundColor = RGB(229, 229, 229);
        [_loginBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _loginBtn.selected = NO;
    }
    return _loginBtn;
}

- (UIButton *)goRegisteBtn {
    if (!_goRegisteBtn) {
        _goRegisteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goRegisteBtn setTitle:@"免费注册" forState:UIControlStateNormal];
        [_goRegisteBtn setTitleColor:RGB(56, 145, 241) forState:UIControlStateNormal];
        _goRegisteBtn.backgroundColor = MainColor;
        [_goRegisteBtn addTarget:self action:@selector(pushRegisteViewController) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goRegisteBtn;
}

-(void)pushNextViewController {
    if (_loginBlock) {
        _loginBlock(@{@"LoginName":self.userNameText.text,@"Lpassword":self.passWordText.text});
    }
}

- (void)pushRegisteViewController {
    if (_registeBlock) {
        _registeBlock();
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (textField == self.userNameText && range.location > 10) {
        return NO;
    }
    return YES;
}

#pragma mark - 监听输入内容变化
- (void)textChanged:(UITextField *)textField {
    if (self.userNameText.text.length == 11 && self.passWordText.text.length > 5) {
        _loginBtn.backgroundColor = RGB(56, 166, 241);
        _loginBtn.userInteractionEnabled = YES;
        _loginBtn.selected = YES;
    } else {
        _loginBtn.backgroundColor =  RGB(229, 229, 229);
        _loginBtn.userInteractionEnabled = NO;
        _loginBtn.selected = NO;
    }
}

@end
