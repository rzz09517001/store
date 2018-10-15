//
//  RZZPayGoodsListTableViewCell.m
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPayGoodsListTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface RZZPayGoodsListTableViewCell()

/**图片*/
@property (nonatomic, strong) UIImageView *goodsImage;
/**商品名字*/
@property (nonatomic, strong) UILabel *goodsTitleLabel;
/**商品价格*/
@property (nonatomic, strong) UILabel *goodsPriceLabel;

@end

@implementation RZZPayGoodsListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.goodsImage];
        [self addSubview:self.goodsTitleLabel];
        [self addSubview:self.goodsPriceLabel];
    }
    return self;
}

-(void)setModel:(RZZPayGoodsListModel *)model {
    _model = model;
    [_goodsImage sd_setImageWithURL:[NSURL URLWithString:model.ImgView]];
    _goodsTitleLabel.text = model.Title;
    _goodsPriceLabel.text = [NSString stringWithFormat:@"%.2lf x %zd",model.Price,model.GoodsCount];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    __weak typeof (self) weakSelf = self;
    [_goodsImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 70));
        make.left.equalTo(weakSelf.mas_left).offset(10);
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    
    [_goodsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.right.equalTo(weakSelf.mas_right).offset(-10);
        make.top.equalTo(weakSelf.mas_top).offset(25);
        make.height.equalTo(@16);
    }];
    
    [_goodsPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.mas_right).offset(-25);
        make.height.equalTo(@16);
        make.left.equalTo(weakSelf.goodsImage.mas_right).offset(10);
        make.bottom.equalTo(weakSelf.mas_bottom).offset(-10);
    }];
}

- (UIImageView *)goodsImage {
    if (!_goodsImage) {
        _goodsImage = [[UIImageView alloc] init];
    }
    return _goodsImage;
}

- (UILabel *)goodsTitleLabel {
    if (!_goodsTitleLabel) {
        _goodsTitleLabel = [[UILabel alloc] init];
        _goodsTitleLabel.font = [UIFont systemFontOfSize:14.0];
        _goodsTitleLabel.textColor = [UIColor blackColor];
    }
    return _goodsTitleLabel;
}

- (UILabel *)goodsPriceLabel {
    if (!_goodsPriceLabel) {
        _goodsPriceLabel = [[UILabel alloc] init];
        _goodsPriceLabel.textAlignment = NSTextAlignmentRight;
        _goodsPriceLabel.font = [UIFont systemFontOfSize:17.0];
        _goodsPriceLabel.textColor = [UIColor blackColor];
    }
    return _goodsPriceLabel;
}
@end
