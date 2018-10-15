//
//  NSString+RZZStringHeight.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "NSString+RZZStringHeight.h"

@implementation NSString (RZZStringHeight)

+ (CGFloat)returnLabelTextHeight:(NSString *)text width:(CGFloat) width font:(UIFont *)font {
    CGFloat height = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size.height;
    return height;
}

@end
