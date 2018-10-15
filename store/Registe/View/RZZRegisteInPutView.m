//
//  RZZRegisteInPutView.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZRegisteInPutView.h"

@interface RZZRegisteInPutView()<UITextFieldDelegate>

/**提示*/
@property (nonatomic, strong) UILabel *tostLabel;
/**用户名*/
@property (nonatomic, strong) UITextField *userNameText;
/**密码*/
@property (nonatomic, strong) UITextField *passWordText;
/**下一步*/
@property (nonatomic, strong) UIButton *nextBtn;
/**去登陆*/
@property (nonatomic, strong) UIButton *goLoginBtn;
/**输入框背景色*/
@property (nonatomic, strong) UILabel *textBackLabel;
/**输入框中间线*/
@property (nonatomic, strong) UILabel *textLineLabel;

@end

@implementation RZZRegisteInPutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tostLabel];
        [self addSubview:self.textBackLabel];
        [self addSubview:self.userNameText];
        [self addSubview:self.passWordText];
        [self addSubview:self.textLineLabel];
        [self addSubview:self.nextBtn];
        [self addSubview:self.goLoginBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof(self)weakSelf = self;
    [_tostLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.top.right.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_left).offset(15);
    }];
    [_textBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@88);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.top.equalTo(weakSelf.tostLabel.mas_bottom);
    }];
    [_userNameText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf).offset(15);
        make.height.equalTo(@44);
        make.top.equalTo(weakSelf.tostLabel.mas_bottom);
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
    [_nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.height.equalTo(@35);
        make.top.equalTo(weakSelf.passWordText.mas_bottom).offset(15);
    }];
    [_goLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 16));
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.nextBtn.mas_bottom).offset(23);
    }];
}

-(UILabel *)tostLabel {
    if (!_tostLabel) {
        _tostLabel = [[UILabel alloc] init];
        _tostLabel.text = @"请输入手机号码注册新用户";
        _tostLabel.font = [UIFont systemFontOfSize:14.0];
        _tostLabel.textColor = RGB(81, 81, 81);
    }
    return _tostLabel;
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
        _passWordText.placeholder = @"设置账号密码";
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

- (UIButton *)nextBtn {
    if (!_nextBtn) {
        _nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        _nextBtn.userInteractionEnabled = NO;
        _nextBtn.backgroundColor = RGB(229, 229, 229);
        [_nextBtn setTitleColor:RGB(132, 132, 132) forState:UIControlStateNormal];
        [_nextBtn addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventTouchUpInside];
        [_nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _nextBtn.selected = NO;
    }
    return _nextBtn;
}

- (UIButton *)goLoginBtn {
    if (!_goLoginBtn) {
        _goLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goLoginBtn setTitle:@"去登陆" forState:UIControlStateNormal];
        [_goLoginBtn setTitleColor:RGB(56, 145, 241) forState:UIControlStateNormal];
        _goLoginBtn.backgroundColor = MainColor;
    }
    return _goLoginBtn;
}

-(void)pushNextViewController {
    if (_nextBlock) {
        _nextBlock(@{@"userName":self.userNameText.text,@"password":self.passWordText.text,@"telePhone":self.userNameText.text});
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
            self.nextBtn.backgroundColor = RGB(56, 166, 241);
            self.nextBtn.userInteractionEnabled = YES;
            self.nextBtn.selected = YES;
        } else {
            self.nextBtn.backgroundColor =  RGB(229, 229, 229);
            self.nextBtn.userInteractionEnabled = NO;
            self.nextBtn.selected = NO;
        }
}
@end
