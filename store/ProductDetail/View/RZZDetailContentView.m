//
//  RZZDetailContentView.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZDetailContentView.h"
#import "RZZDetailContentModel.h"
#import "NSString+RZZStringHeight.h"

@implementation RZZDetailContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setContentArray:(NSArray *)contentArray {
    _contentArray = contentArray;
    CGFloat textHeight = 13;
    for (RZZDetailContentModel *model in contentArray) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, textHeight, 58, 12)];
        titleLabel.text = model.title;
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:titleLabel];
        CGFloat height = [NSString returnLabelTextHeight:model.Value width:(VIEW_WIDTH - 190) font:[UIFont systemFontOfSize:13.0]];
        UILabel *contentLable = [[UILabel alloc] initWithFrame:CGRectMake(75, textHeight, VIEW_WIDTH-190, height)];
        contentLable.font = [UIFont systemFontOfSize:12.0];
        contentLable.text = model.Value;
        contentLable.numberOfLines = 0;
        [self addSubview:contentLable];
        textHeight = textHeight + height + 15;
    }
    if (_returnHeightBlock) {
        _returnHeightBlock(textHeight);
    }
}


@end
