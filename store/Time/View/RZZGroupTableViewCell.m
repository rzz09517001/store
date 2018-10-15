//
//  RZZGroupTableViewCell.m
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZGroupTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface RZZGroupTableViewCell()
/**图片*/
@property (nonatomic, strong) UIImageView *groupImageView;

@end

@implementation RZZGroupTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.groupImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    __weak __typeof(self) weakSelf = self;
    [_groupImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 10, 0));
    }];
}

- (UIImageView *)groupImageView {
    if (!_groupImageView) {
        _groupImageView = [[UIImageView alloc] init];
    }
    return _groupImageView;
}

- (void)setImageUrl:(NSString *)imageUrl {
    [_groupImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
}

@end
