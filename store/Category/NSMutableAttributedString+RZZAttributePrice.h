//
//  NSMutableAttributedString+RZZAttributePrice.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (RZZAttributePrice)

+(NSMutableAttributedString *)makeAttributedPrice:(NSString *)frontPrice oldPrice:(NSString *)backPrice;

+(NSMutableAttributedString *)makeAllPriceTetx:(CGFloat)price;

@end

NS_ASSUME_NONNULL_END
