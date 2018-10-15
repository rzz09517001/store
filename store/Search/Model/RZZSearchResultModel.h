//
//  RZZSearchResultModel.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZSearchResultModel : NSObject

/**商品简述*/
@property (copy, nonatomic) NSString *Abbreviation;

/**商品标题*/
@property (copy, nonatomic) NSString *Title;

/**老价格*/
@property (copy, nonatomic) NSString *DomesticPrice;

/**当前价格*/
@property (copy, nonatomic) NSString *Price;

/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;

/**国旗地址*/
@property (copy, nonatomic) NSString *CountryImg;

/**商品图片地址*/
@property (copy, nonatomic) NSString *ImgView;
@end

NS_ASSUME_NONNULL_END
