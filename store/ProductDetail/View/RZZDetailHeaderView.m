//
//  RZZDetailHeaderView.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZDetailHeaderView.h"
#import <SDCycleScrollView.h>

@interface RZZDetailHeaderView()<SDCycleScrollViewDelegate>

/**顶部轮播图*/
@property (nonatomic, strong) SDCycleScrollView *headImageView;
/**多少人购买*/
@property (nonatomic, strong) UILabel *buyNumLabel;
@end

@implementation RZZDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headImageView];
        [self addSubview:self.buyNumLabel];
        __weak __typeof(self) weakSelf = self;
        [_buyNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(90, 22));
            make.bottom.equalTo(weakSelf.headImageView.mas_bottom).offset(-30);
            make.right.equalTo(weakSelf.headImageView.mas_right).offset(11);
        }];
    }
    return self;
}

-(void)setImageArray:(NSArray *)imageArray {
    _headImageView.imageURLStringsGroup = imageArray;
}

- (SDCycleScrollView *)headImageView {
    if (!_headImageView) {
        _headImageView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 300) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        //page居右
        _headImageView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _headImageView.pageDotColor = [UIColor whiteColor];
        _headImageView.currentPageDotColor = [UIColor blueColor];
    }
    return _headImageView;
}

- (UILabel *)buyNumLabel {
    if (!_buyNumLabel) {
        _buyNumLabel = [[UILabel alloc] init];
        _buyNumLabel.text = @"100人已经购买";
        _buyNumLabel.backgroundColor = RGB(230, 51, 3);
        _buyNumLabel.textColor = [UIColor whiteColor];
        _buyNumLabel.layer.masksToBounds =  YES;
        _buyNumLabel.layer.cornerRadius = 11.0;
        _buyNumLabel.textAlignment = NSTextAlignmentCenter;
        _buyNumLabel.font = [UIFont systemFontOfSize:11.0];
    }
    return _buyNumLabel;
}
@end
