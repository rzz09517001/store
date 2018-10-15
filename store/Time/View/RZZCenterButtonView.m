//
//  RZZCenterButtonView.m
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZCenterButtonView.h"

@implementation RZZCenterButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.newProBtn];
        [self addSubview:self.hotProBtn];
    }
    return self;
}

- (UIButton *)newProBtn {
    if (!_newProBtn) {
        _newProBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _newProBtn.frame = CGRectMake(0, 0, VIEW_WIDTH / 2, 50);
        [_newProBtn setTitle:@"新品团购" forState:UIControlStateNormal];
        [_newProBtn setTitleColor:RGB(56, 166, 243) forState:UIControlStateNormal];
        [_newProBtn setTitleColor:RGB(213, 48, 34) forState:UIControlStateSelected];
        [_newProBtn setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标未选中"] forState:UIControlStateNormal];
        [_newProBtn setImage:[UIImage imageNamed:@"限时特卖界面新品团购图标"] forState:UIControlStateSelected];
        _newProBtn.selected = YES;
    }
    return _newProBtn;
}

- (UIButton *)hotProBtn {
    if (!_hotProBtn) {
        _hotProBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _hotProBtn.frame = CGRectMake(VIEW_WIDTH / 2, 0, VIEW_WIDTH / 2, 50);
        [_hotProBtn setTitle:@"品牌团购" forState:UIControlStateNormal];
        [_hotProBtn setTitleColor:RGB(56, 166, 243) forState:UIControlStateNormal];
        [_hotProBtn setTitleColor:RGB(213, 48, 34) forState:UIControlStateSelected];
        [_hotProBtn setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标"] forState:UIControlStateNormal];
        [_hotProBtn setImage:[UIImage imageNamed:@"限时特卖界面品牌团购图标选中"] forState:UIControlStateSelected];
    }
    return _hotProBtn;
}


@end
