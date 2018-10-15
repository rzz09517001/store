//
//  RZZVerificationView.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZVerificationView.h"

@interface RZZVerificationView()<UITextFieldDelegate>

/**提示*/
@property (nonatomic, strong) UILabel *hint;
/**输入框*/
@property (nonatomic, strong) UITextField *textField;
/**倒计时*/
@property (nonatomic, strong) UIButton *timeBtn;
/**输入框背景*/
@property (nonatomic, strong) UILabel *backLabel;
/**竖线*/
@property (nonatomic, strong) UILabel *lineLabel;
/**注册按钮*/
@property (nonatomic, strong) UIButton *registeBtn;

@end

@implementation RZZVerificationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hint];
        [self addSubview:self.backLabel];
        [self addSubview:self.textField];
        [self addSubview:self.lineLabel];
        [self addSubview:self.timeBtn];
        [self addSubview:self.registeBtn];
        [self GCDTime];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof(self)weakSelf = self;
    [_hint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@35);
        make.top.right.equalTo(weakSelf);
        make.left.equalTo(weakSelf.mas_left).offset(15);
    }];
    [_backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@44);
        make.left.equalTo(weakSelf.mas_left).offset(-1);
        make.right.equalTo(weakSelf.mas_right).offset(1);
        make.top.equalTo(weakSelf.hint.mas_bottom);
    }];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.backLabel.mas_left).offset(15);
        make.top.bottom.equalTo(weakSelf.backLabel);
        make.right.equalTo(weakSelf.backLabel.mas_left).offset(VIEW_WIDTH - 110);
    }];
    [_timeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 44));
        make.right.top.equalTo(weakSelf.backLabel);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(1, 30));
        make.right.equalTo(weakSelf.timeBtn.mas_left);
        make.centerY.equalTo(weakSelf.backLabel.mas_centerY);
    }];
    [_registeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(16);
        make.right.equalTo(weakSelf.mas_right).offset(-16);
        make.top.equalTo(weakSelf.backLabel.mas_bottom).offset(15);
        make.height.equalTo(@35);
    }];
}

- (UILabel *)hint {
    if (!_hint) {
        _hint = [[UILabel alloc] init];
        _hint.text = @"验证码已经发送到 +86";
        _hint.font = [UIFont systemFontOfSize:12.0];
    }
    return _hint;
}

- (UILabel *)backLabel {
    if (!_backLabel) {
        _backLabel = [[UILabel alloc] init];
        _backLabel.backgroundColor = [UIColor whiteColor];
        _backLabel.layer.borderColor = RGB(188, 188, 188).CGColor;
        _backLabel.layer.borderWidth = 1;
    }
    return _backLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.placeholder = @"请输入验证码";
        [_textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(188, 188, 188);
    }
    return _lineLabel;
}

- (UIButton *)timeBtn {
    if (!_timeBtn) {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_timeBtn addTarget:self action:@selector(GCDTime) forControlEvents:UIControlEventTouchUpInside];
    }
    return _timeBtn;
}

- (UIButton *)registeBtn {
    if (!_registeBtn) {
        _registeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registeBtn setTitle:@"注册" forState:UIControlStateNormal];
        _registeBtn.backgroundColor = RGB(229, 229, 229);
        _registeBtn.userInteractionEnabled = NO;
        [_registeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _registeBtn.selected = NO;
        [_registeBtn addTarget:self action:@selector(registeMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registeBtn;
}

- (void)setPhoneNum:(NSString *)phoneNum {
    _phoneNum = phoneNum;
    self.hint.attributedText = [self makeHintLabelText];
}

- (void)registeMethod {
    if (_registeBlock) {
        _registeBlock(_textField.text);
    }
}

#pragma mark - makeAttributeText
/**
 拼接hintLabelText

 @return <#return value description#>
 */
-(NSMutableAttributedString *)makeHintLabelText {
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:@"验证码已经发送到 " attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139)}];
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"+86 %@",_phoneNum] attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    [string1 insertAttributedString:string2 atIndex:string1.length];
    return string1;
}


/**
 拼接TimeBtnText

 @return <#return value description#>
 */
-(NSMutableAttributedString *)makeTimeBtnText:(NSInteger ) time {
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%li", time] attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:@"秒后重试" attributes:@{NSForegroundColorAttributeName:RGB(139, 139, 139)}];
    [string1 insertAttributedString:string2 atIndex:string1.length];
    return string1;
}

#pragma mark - time
- (void)GCDTime {
    __block NSInteger time = 50;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (time < 1) {
            dispatch_source_cancel(timer);
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"重新发送" attributes:@{NSForegroundColorAttributeName:RGB(56, 166, 243)}];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.timeBtn setAttributedTitle:string forState:UIControlStateNormal];
                _timeBtn.userInteractionEnabled = YES;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.timeBtn.userInteractionEnabled = NO;
                RZZLog(@"触发计时器");
                [self.timeBtn setAttributedTitle:[self makeTimeBtnText:time] forState:UIControlStateNormal];
            });
            time --;
        }
    });
    dispatch_resume(timer);
}

#pragma mark - textChange
-(void)textChange:(UITextField *) text {
    if (text.text.length == 6) {
        self.registeBtn.userInteractionEnabled = YES;
        self.registeBtn.backgroundColor = RGB(56, 166, 241);
        self.registeBtn.selected = YES;
    } else {
        self.registeBtn.userInteractionEnabled = NO;
        self.registeBtn.backgroundColor = RGB(229, 229, 229);
        self.registeBtn.selected = NO;
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (range.location == 6) {
        return NO;
    }
    return YES;
}

@end
