//
//  RZZGoodsListCollectionViewCell.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZGoodsListCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "NSMutableAttributedString+RZZAttributePrice.h"

@interface RZZGoodsListCollectionViewCell()

/**国旗*/
@property (nonatomic, strong) UIImageView *countryImage;
/**图片*/
@property (nonatomic, strong) UIImageView *goodsImage;
/**标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;

@end

@implementation RZZGoodsListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.goodsImage];
        [self addSubview:self.countryImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(0, 0, 80, 0));
    }];
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(11);
        make.left.equalTo(self.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(22, 16));
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.goodsImage.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.left.equalTo(self.mas_left).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.height.mas_equalTo(16);
    }];
}

- (void)setDataModel:(RZZSearchResultModel *)dataModel {
    _dataModel = dataModel;
    [self.goodsImage sd_setImageWithURL:[NSURL URLWithString:dataModel.ImgView]];
    [self.countryImage sd_setImageWithURL:[NSURL URLWithString:dataModel.CountryImg]];
    self.titleLabel.text = dataModel.Title;
    self.priceLabel.attributedText = [NSMutableAttributedString makeAttributedPrice:dataModel.Price oldPrice:dataModel.DomesticPrice];
}

- (UIImageView *)countryImage {
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}

- (UIImageView *)goodsImage {
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc] init];
    }
    return _goodsImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:13.0];
        _titleLabel.numberOfLines = 2;
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
@end
