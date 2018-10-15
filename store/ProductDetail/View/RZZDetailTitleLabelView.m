//
//  RZZDetailTitleLabelView.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZDetailTitleLabelView.h"
#import <UIImageView+WebCache.h>
#import "NSString+RZZStringHeight.h"
#import "NSMutableAttributedString+RZZAttributePrice.h"

@interface RZZDetailTitleLabelView()

/**标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;
/**分割线*/
@property (nonatomic, strong) UILabel *priceLineLabel;
/**描述信息*/
@property (nonatomic, strong) UILabel *contentLabel;
/**商户背景*/
@property (nonatomic, strong) UIView *backView;
/**跳转的商户按钮*/
@property (nonatomic, strong) UIButton *nextViewBtn;
/**商户名称*/
@property (nonatomic, strong) UILabel *shopNameLabel;
/**商家图标*/
@property (nonatomic, strong) UIImageView *iconImage;
/**国旗*/
@property (nonatomic, strong) UIImageView *countryImage;
/**国家*/
@property (nonatomic, strong) UILabel *countryNameLabel;
/**向右箭头指示*/
@property (nonatomic, strong) UIImageView *nextImage;
/**图文详情*/
@property (nonatomic, strong) UILabel *detailLabel;
/**图文详情下分割线*/
@property (nonatomic, strong) UILabel *detailLineLabel;

@end

@implementation RZZDetailTitleLabelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.priceLineLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.backView];
        [self addSubview:self.nextViewBtn];
        [self addSubview:self.iconImage];
        [self addSubview:self.shopNameLabel];
        [self addSubview:self.countryImage];
        [self addSubview:self.countryNameLabel];
        [self addSubview:self.nextImage];
        [self addSubview:self.detailLabel];
        [self addSubview:self.detailLineLabel];
        [self addLayout];
    }
    return self;
}

- (void)addLayout {
    __weak typeof(self) weakSelf = self;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        //make.height.equalTo(@40);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(25);
        make.height.mas_equalTo(20);
    }];
    [_priceLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.priceLabel.mas_bottom).offset(25);
        make.height.mas_equalTo(1);
    }];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.priceLineLabel.mas_bottom).offset(20);
        //make.height.mas_equalTo(20);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf);
        make.top.equalTo(weakSelf.contentLabel.mas_bottom).offset(18);
        make.height.mas_equalTo(100);
    }];
    [_nextViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.backView).with.insets(UIEdgeInsetsMake(10, 0, 10, 0));
    }];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.nextViewBtn.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(50, 50));
        make.centerY.equalTo(weakSelf.nextViewBtn.mas_centerY);
    }];
    [_shopNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(5);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(16);
        make.height.equalTo(@12);
        make.right.equalTo(weakSelf.mas_right).offset(-120);
    }];
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 13));
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(16);
        make.bottom.equalTo(weakSelf.iconImage.mas_bottom).offset(-5);
    }];
    [_countryNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.countryImage.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(70, 15));
        make.left.equalTo(weakSelf.countryImage.mas_right).offset(5);
    }];
    [_nextImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(10, 15));
        make.right.equalTo(weakSelf.backView.mas_right).offset(-15);
        make.centerY.equalTo(weakSelf.backView.mas_centerY);
    }];
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.size.mas_equalTo(CGSizeMake(70, 50));
        make.top.equalTo(weakSelf.backView.mas_bottom);
    }];
    [_detailLineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(weakSelf.mas_left).offset(15);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.top.equalTo(weakSelf.detailLabel.mas_bottom);
    }];
}

- (void)setModel:(RZZDetailTitleModel *)model {
    _model = model;
    _titleLabel.text = model.Abbreviation;
    CGFloat height = [NSString returnLabelTextHeight:model.Abbreviation width:(VIEW_WIDTH-60) font:[UIFont boldSystemFontOfSize:16.0]];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
    }];
    NSMutableAttributedString *price = [NSMutableAttributedString makeAttributedPrice:model.Price oldPrice:model.OriginalPrice];
    NSMutableAttributedString *discount = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"  %@",model.Discount] attributes:nil];
    [price insertAttributedString:discount atIndex:[price length]];
    _priceLabel.attributedText = price;
    _contentLabel.text = model.GoodsIntro;
    CGFloat contentHeight = [NSString returnLabelTextHeight:model.GoodsIntro width:(VIEW_WIDTH-30) font:[UIFont systemFontOfSize:14.0]];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(contentHeight);
    }];
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.ShopImage]];
    _shopNameLabel.text = model.BrandCNName;
    [_countryImage sd_setImageWithURL:[NSURL URLWithString:@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg"]];
    _countryNameLabel.text = model.CountryName;
    if (_returnHeightBlock) {
        _returnHeightBlock(260 + contentHeight + height);
    }
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15.0];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _priceLabel;
}

- (UILabel *)priceLineLabel {
    if (!_priceLineLabel) {
        _priceLineLabel = [[UILabel alloc] init];
        _priceLineLabel.backgroundColor = RGB(242, 242, 242);
    }
    return _priceLineLabel;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textColor = RGB(83, 83, 83);
        _contentLabel.font = [UIFont systemFontOfSize:13.0];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = MainColor;
    }
    return _backView;
}

- (UIButton *)nextViewBtn {
    if (!_nextViewBtn) {
        _nextViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextViewBtn.backgroundColor = [UIColor whiteColor];
    }
    return _nextViewBtn;
}

- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}

- (UILabel *)shopNameLabel {
    if (!_shopNameLabel) {
        _shopNameLabel = [[UILabel alloc] init];
        _shopNameLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _shopNameLabel;
}

- (UIImageView *)countryImage {
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}
- (UILabel *)countryNameLabel {
    if (!_countryNameLabel) {
        _countryNameLabel = [[UILabel alloc] init];
        _countryNameLabel.font = [UIFont systemFontOfSize:12.0];
    }
    return _countryNameLabel;
}

- (UIImageView *)nextImage {
    if (!_nextImage) {
        _nextImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"下一步"]];
    }
    return _nextImage;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont boldSystemFontOfSize:14.0];
        _detailLabel.text = @"图文详情";
    }
    return _detailLabel;
}

- (UILabel *)detailLineLabel {
    if (!_detailLineLabel) {
        _detailLineLabel = [[UILabel alloc] init];
        _detailLineLabel.backgroundColor = RGB(242, 242, 242);
    }
    return _detailLineLabel;
}
@end
