//
//  RZZGoodsListBarButtonView.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZGoodsListBarButtonView.h"

@interface RZZGoodsListBarButtonView()

/**热门*/
@property (nonatomic, strong) UIButton *hostBtn;
/**价格*/
@property (nonatomic, strong) UIButton *priceBtn;
/**好评*/
@property (nonatomic, strong) UIButton *goodBtn;
/**新品*/
@property (nonatomic, strong) UIButton *newsBtn;
/**滑动的label*/
@property (nonatomic, strong) UILabel *lineLabel;
/**中间传递Btn*/
@property (nonatomic, strong) UIButton *oldBtn;
@end

@implementation RZZGoodsListBarButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.hostBtn];
        [self addSubview:self.priceBtn];
        [self addSubview:self.goodBtn];
        [self addSubview:self.newsBtn];
        [self addSubview:self.lineLabel];
        [self addLayout];
        self.oldBtn = self.hostBtn;
    }
    return self;
}

- (void)addLayout {
    [_hostBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(VIEW_WIDTH/4);
    }];
    [_priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.hostBtn.mas_right);
        make.width.equalTo(self.hostBtn);
    }];
    [_goodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.priceBtn.mas_right);
        make.width.equalTo(self.hostBtn);
    }];
    [_newsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.goodBtn.mas_right);
        make.width.equalTo(self.hostBtn);
    }];
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 2));
        make.bottom.equalTo(self);
        make.centerX.equalTo(self.hostBtn.mas_centerX);
    }];
}

-(void)fourBtnTouchMethod:(UIButton *)sender {
    sender.selected = YES;
    self.oldBtn.selected = NO;
    self.oldBtn = sender;
    [_lineLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 2));
        make.bottom.equalTo(self);
        make.centerX.equalTo(sender.mas_centerX);
    }];
    //    加个动画
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

- (UIButton *)hostBtn {
    if (!_hostBtn) {
        _hostBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_hostBtn setTitle:@"热门" forState:UIControlStateNormal];
        _hostBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_hostBtn setTitleColor:RGB(162, 162, 162) forState:UIControlStateNormal];
        [_hostBtn setTitleColor:RGB(53, 161, 241) forState:UIControlStateSelected];
        _hostBtn.selected = YES;
        [_hostBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _hostBtn;
}

- (UIButton *)priceBtn {
    if (!_priceBtn) {
        _priceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_priceBtn setTitle:@"价格" forState:UIControlStateNormal];
        _priceBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_priceBtn setTitleColor:RGB(162, 162, 162) forState:UIControlStateNormal];
        [_priceBtn setTitleColor:RGB(53, 161, 241) forState:UIControlStateSelected];
        _priceBtn.selected = NO;
        [_priceBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _priceBtn;
}

- (UIButton *)goodBtn {
    if (!_goodBtn) {
        _goodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodBtn setTitle:@"好评" forState:UIControlStateNormal];
        _goodBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_goodBtn setTitleColor:RGB(162, 162, 162) forState:UIControlStateNormal];
        [_goodBtn setTitleColor:RGB(53, 161, 241) forState:UIControlStateSelected];
        _goodBtn.selected = NO;
        [_goodBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodBtn;
}

- (UIButton *)newsBtn {
    if (!_newsBtn) {
        _newsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_newsBtn setTitle:@"新品" forState:UIControlStateNormal];
        _newsBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_newsBtn setTitleColor:RGB(162, 162, 162) forState:UIControlStateNormal];
        [_newsBtn setTitleColor:RGB(53, 161, 241) forState:UIControlStateSelected];
        _newsBtn.selected = NO;
        [_newsBtn addTarget:self action:@selector(fourBtnTouchMethod:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _newsBtn;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        _lineLabel.backgroundColor = RGB(53, 161, 241);
    }
    return _lineLabel;
}

@end
