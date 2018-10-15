//
//  RZZBottomImageView.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZBottomImageView.h"
#import "RZZDetailImageModel.h"
#import <UIImageView+WebCache.h>

@implementation RZZBottomImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setImageArray:(NSArray *)imageArray {
    CGFloat height = 0;
    for (RZZDetailImageModel *model in imageArray) {
        NSArray *stringArray = [model.resolution componentsSeparatedByString:@"*"];
        CGFloat x = VIEW_WIDTH / [stringArray[0] floatValue] *[stringArray[1] floatValue];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, height, VIEW_WIDTH,x)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.img]];
        [self addSubview:imageView];
        height = height + x;
    }
    if (_heightBlock) {
        _heightBlock(height);
    }
}
@end
