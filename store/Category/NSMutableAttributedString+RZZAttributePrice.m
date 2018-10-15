//
//  NSMutableAttributedString+RZZAttributePrice.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "NSMutableAttributedString+RZZAttributePrice.h"

@implementation NSMutableAttributedString (RZZAttributePrice)

+(NSMutableAttributedString *)makeAttributedPrice:(NSString *)frontPrice oldPrice:(NSString *)backPrice {
    NSString *newPrice = [NSString stringWithFormat:@"￥%@", frontPrice];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:newPrice attributes:@{NSForegroundColorAttributeName:RGB(230, 51, 37),NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0]}];
    NSString *oldPrice = [NSString stringWithFormat:@"%@", backPrice];
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:oldPrice attributes:@{NSForegroundColorAttributeName:RGB(132, 132, 132),NSFontAttributeName:[UIFont boldSystemFontOfSize:12.0],NSStrikethroughStyleAttributeName:@(2)}];
    [string insertAttributedString:string1 atIndex:[string length]];
    return string;
}

+(NSMutableAttributedString *)makeAllPriceTetx:(CGFloat)price {
    NSString *string = @"合计：";
    NSMutableAttributedString *string1 = [[NSMutableAttributedString alloc] initWithString:string attributes:@{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont systemFontOfSize:12.0]}];
    NSString *allPrice = [NSString stringWithFormat:@"￥%.2lf", price];
    NSMutableAttributedString *string2 = [[NSMutableAttributedString alloc] initWithString:allPrice attributes:@{NSForegroundColorAttributeName:RGB(239, 46, 37),NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0]}];
    [string1 insertAttributedString:string2 atIndex:[string1 length]];
    return string1;
}

@end
