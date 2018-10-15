//
//  RZZBuyCarTableViewCell.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZBuyCarTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface RZZBuyCarTableViewCell()

/**标题*/
@property (nonatomic, strong) UILabel *titleLabel;
/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;
/**商品个数*/
@property (nonatomic, strong) UILabel *numberLabel;
/**图片*/
@property (nonatomic, strong) UIImageView *iconImage;
/**数目背景*/
@property (nonatomic, strong) UIImageView *backImage;

@end

@implementation RZZBuyCarTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.priceLabel];
        [self addSubview:self.isSelectBtn];
        [self addSubview:self.iconImage];
        [self addSubview:self.backImage];
        [self addSubview:self.addBtn];
        [self addSubview:self.numberLabel];
        [self addSubview:self.cutBtn];
    }
    return self;
}

-(void)setModel:(RZZBuyCarModel *)model {
    _model = model;
    _isSelectBtn.selected = model.isSelectButton;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
    _titleLabel.text = model.GoodsTitle;
    _priceLabel.text = [NSString stringWithFormat:@"￥%.f",model.Price];
    _numberLabel.text = [NSString stringWithFormat:@"%li",model.GoodsCount];    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_isSelectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(21, 21));
        make.left.equalTo(self.mas_left).offset(15);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_iconImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(53, 53));
        make.left.equalTo(self.isSelectBtn.mas_right).offset(8);
        make.centerY.equalTo(self.mas_centerY);
    }];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImage.mas_right).offset(18);
        make.top.equalTo(self.iconImage.mas_top);
        make.right.equalTo(self.mas_right).offset(-20);
        make.height.mas_equalTo(14);
    }];
    [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImage.mas_right).offset(18);
        make.bottom.equalTo(self.iconImage.mas_bottom).offset(-7);
        make.right.equalTo(self.backImage.mas_right).offset(-20);
        make.height.mas_equalTo(13);
    }];
    [_backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(85, 25));
        make.bottom.equalTo(self.mas_bottom).offset(-15);
        make.right.equalTo(self.mas_right).offset(-17);
    }];
    [_cutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.left.top.equalTo(self.backImage);
    }];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.right.top.equalTo(self.backImage);
    }];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.top.equalTo(self.backImage);
        make.width.mas_equalTo(35);
        make.centerX.equalTo(self.backImage.mas_centerX);
    }];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont systemFontOfSize:13.0];
        _priceLabel.textColor = [UIColor blackColor];
    }
    return _priceLabel;
}

- (UILabel *)numberLabel {
    if (!_numberLabel) {
        _numberLabel = [[UILabel alloc] init];
        _numberLabel.font = [UIFont systemFontOfSize:12.0];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _numberLabel;
}

- (UIButton *)isSelectBtn {
    if (!_isSelectBtn) {
        _isSelectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_isSelectBtn setImage:[UIImage imageNamed:@"购物车界面商品未选中"] forState:UIControlStateNormal];
        [_isSelectBtn setImage:[UIImage imageNamed:@"购物车界面商品选中对号按钮"] forState:UIControlStateSelected];
    }
    return _isSelectBtn;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addBtn.backgroundColor = [UIColor clearColor];
    }
    return _addBtn;
}

- (UIButton *)cutBtn {
    if (!_cutBtn) {
        _cutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cutBtn.backgroundColor = [UIColor clearColor];
    }
    return _cutBtn;
}

- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] init];
    }
    return _iconImage;
}

- (UIImageView *)backImage {
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"购物车界面商品加减按钮"]];
    }
    return _backImage;
}

@end
