//
//  RZZSingleTableViewCell.m
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZSingleTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface RZZSingleTableViewCell()

/**图片*/
@property (nonatomic, strong) UIImageView *iconImage;
/**国旗*/
@property (nonatomic, strong) UIImageView *countryImage;
/**标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/**描述*/
@property (nonatomic, strong) UILabel *bodyLabel;
/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;
/**购物车*/
@property (nonatomic, strong) UIButton *carBtn;

@end

@implementation RZZSingleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.iconImage];
        [self addSubview:self.countryImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.bodyLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.carBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak typeof (self) weakSelf = self;
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(140, 140));
        make.left.equalTo(weakSelf.mas_left).offset(5);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [_countryImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 20));
        make.left.equalTo(weakSelf.iconImage.mas_left).offset(8);
        make.top.equalTo(weakSelf.iconImage.mas_top).offset(8);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.height.equalTo(@15);
    }];
    [_bodyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabel.mas_bottom).offset(7);
        make.right.equalTo(weakSelf.mas_right).offset(-15);
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.height.equalTo(@60);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.iconImage.mas_right).offset(6);
        make.height.equalTo(@15);
        make.right.equalTo(weakSelf.carBtn.mas_left).offset(-20);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-23);
    }];
    [_carBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(37, 37));
        make.right.equalTo(weakSelf.mas_right).offset(-45);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-20);
    }];
}

- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}

- (UIImageView *)countryImage {
    if (!_countryImage) {
        _countryImage = [[UIImageView alloc] init];
    }
    return _countryImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        _titleLabel.textColor = RGB(81, 81, 81);
    }
    return _titleLabel;
}

- (UILabel *)bodyLabel {
    if (!_bodyLabel) {
        _bodyLabel = [[UILabel alloc] init];
        _bodyLabel.textColor = RGB(35, 35, 35);
        _bodyLabel.font = [UIFont systemFontOfSize:13.0];
        _bodyLabel.numberOfLines = 3;
    }
    return _bodyLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        
    }
    return _priceLabel;
}

- (UIButton *)carBtn {
    if (!_carBtn) {
        _carBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_carBtn setImage:[UIImage imageNamed:@"限时特卖界面购物车图标"] forState:UIControlStateNormal];
    }
    return _carBtn;
}

- (void)setSingleModel:(RZZSigleListModel *)singleModel {
    _singleModel = singleModel;
    _titleLabel.text = singleModel.title;
    _bodyLabel.text = singleModel.body;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:singleModel.img]];
    [_countryImage sd_setImageWithURL:[NSURL URLWithString:singleModel.img]];
    [self priceAttributedString];
}

- (void)priceAttributedString {
    //当前价格
    NSString *price = [NSString stringWithFormat:@"￥%@  ",_singleModel.status];
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:price attributes:@{NSForegroundColorAttributeName:RGB(230, 51, 37),NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0]}];
    //以往价格
    NSString *old = [NSString stringWithFormat:@"￥%@",_singleModel.type];
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:old attributes:@{NSForegroundColorAttributeName:RGB(132, 132, 132),NSFontAttributeName:[UIFont systemFontOfSize:12.0],NSStrikethroughStyleAttributeName:@(2)}];
    [string1 insertAttributedString:string2 atIndex:[string1 length]];
    _priceLabel.attributedText = string1;
}

@end
