//
//  RZZDetailTabBarView.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZDetailTabBarView.h"

@interface RZZDetailTabBarView()

/**购物车按钮*/
@property (nonatomic, strong) UIButton *buyCarBtn;
/**加入购物车*/
@property (nonatomic, strong) UIButton *addBuyCarBtn;
/**立即购买*/
@property (nonatomic, strong) UIButton *buyNowBtn;
/**背景图*/
@property (nonatomic, strong) UIImageView *tabBackImage;

@end


@implementation RZZDetailTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.tabBackImage];
        [self addSubview:self.buyCarBtn];
        [self addSubview:self.addBuyCarBtn];
        [self addSubview:self.buyNowBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof(self) weakSelf = self;
    [_buyCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(13);
        make.size.mas_equalTo(CGSizeMake(26, 26));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_addBuyCarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.left.equalTo(weakSelf.buyCarBtn.mas_right).offset(34);
        make.height.mas_equalTo(35);
        make.right.equalTo(weakSelf.buyNowBtn.mas_left).offset(-15);
    }];
    [_buyNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.mas_centerY);
        make.height.mas_equalTo(35);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.width.equalTo(weakSelf.addBuyCarBtn.mas_width);
    }];
    [_tabBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(weakSelf);
    }];
}

- (UIButton *)buyCarBtn {
    if (!_buyCarBtn) {
        _buyCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyCarBtn setImage:[UIImage imageNamed:@"详情界面购物车按钮"] forState:UIControlStateNormal];
    }
    return _buyCarBtn;
}

- (UIButton *)addBuyCarBtn {
    if (!_addBuyCarBtn) {
        _addBuyCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addBuyCarBtn setImage:[UIImage imageNamed:@"详情界面加入购物车按钮"] forState:UIControlStateNormal];
        [_addBuyCarBtn  addTarget:self action:@selector(addGoodsInBuyCar) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBuyCarBtn;
}

- (UIButton *)buyNowBtn {
    if (!_buyNowBtn) {
        _buyNowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_buyNowBtn setImage:[UIImage imageNamed:@"详情界面立即购买按钮"] forState:UIControlStateNormal];
    }
    return _buyNowBtn;
}

- (UIImageView *)tabBackImage {
    if (!_tabBackImage) {
        _tabBackImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tabbar_back"]];
    }
    return _tabBackImage;
}

- (void)addGoodsInBuyCar {
    if (_addBlock) {
        _addBlock();
    }
}
@end
