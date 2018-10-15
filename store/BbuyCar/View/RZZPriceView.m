//
//  RZZPriceView.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPriceView.h"
#import "NSMutableAttributedString+RZZAttributePrice.h"

@interface RZZPriceView()

/**全场包邮*/
@property (nonatomic, strong) UILabel *allLabel;
/**去支付*/
@property (nonatomic, strong) UIButton *goPayBtn;

@end

@implementation RZZPriceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.priceLabel];
        [self addSubview:self.allLabel];
        [self addSubview:self.goPayBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(10);
        make.left.equalTo(self.mas_left).offset(7);
        make.height.equalTo(@17);
        make.right.equalTo(self.goPayBtn.mas_left).offset(-20);
    }];
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.priceLabel.mas_bottom).offset(7);
        make.size.mas_equalTo(CGSizeMake(62, 14));
        make.left.equalTo(self.mas_left).offset(60);
    }];
    [_goPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(110, 35));
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
    }];
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.attributedText = [NSMutableAttributedString makeAllPriceTetx:0.00];
        _priceLabel.textColor = [UIColor redColor];
    }
    return _priceLabel;
}

- (UILabel *)allLabel {
    if (!_allLabel) {
        _allLabel = [[UILabel alloc] init];
        _allLabel.text = @"全场包邮";
        _allLabel.font = [UIFont systemFontOfSize:13.0];
        _allLabel.textColor = RGB(87, 87, 87);
    }
    return _allLabel;
}

- (UIButton *)goPayBtn {
    if (!_goPayBtn) {
        _goPayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goPayBtn setImage:[UIImage imageNamed:@"购物车界面去结算按钮"] forState:UIControlStateNormal];
        [_goPayBtn addTarget:self action:@selector(goPayBtnMethod) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goPayBtn;
}

- (void)goPayBtnMethod {
    if (_gotoInsert) {
        _gotoInsert();
    }
}
@end

