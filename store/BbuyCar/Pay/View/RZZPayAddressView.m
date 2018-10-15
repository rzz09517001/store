//
//  RZZPayAdressView.m
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPayAddressView.h"

@interface RZZPayAddressView()

/**地址*/
@property (nonatomic, strong) UILabel *addressLabel;
/**电话*/
@property (nonatomic, strong) UILabel *iphoneLabel;
/**图片*/
@property (nonatomic, strong) UIImageView *addressImage;
/**背景button*/
@property (nonatomic, strong) UIButton *backBtn;

@end

@implementation RZZPayAddressView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backBtn];
        [self addSubview:self.addressLabel];
        [self addSubview:self.iphoneLabel];
        [self addSubview:self.addressImage];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [_addressImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 10));
        make.centerY.equalTo(self.backBtn.mas_centerY);
        make.left.equalTo(self.mas_left).offset(8);
    }];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.addressImage.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.equalTo(@30);
    }];
    
    [_iphoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressImage.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        make.height.equalTo(@15);
    }];
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = [UIColor grayColor];
        _addressLabel.font = [UIFont systemFontOfSize:13.0];
        _addressLabel.text = @"深圳市宝安区1001号大厦";
    }
    return _addressLabel;
}

- (UIImageView *)addressImage {
    if (!_addressImage) {
        _addressImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"位置"]];
    }
    return _addressImage;
}

- (UILabel *)iphoneLabel {
    if (!_iphoneLabel) {
        _iphoneLabel = [[UILabel alloc] init];
        _iphoneLabel.text = @"18888888888";
        _iphoneLabel.textColor = [UIColor grayColor];
        _iphoneLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _iphoneLabel;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_backBtn setImage:[UIImage imageNamed:@"地址背景"] forState:UIControlStateNormal];
    }
    return _backBtn;
}
@end
