//
//  RZZDetailTitleModel.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZDetailTitleModel : NSObject

/**折扣价格*/
@property(nonatomic, copy) NSString *Price;
/**原价*/
@property (nonatomic, copy) NSString *OriginalPrice;
/**折扣数*/
@property(nonatomic, copy) NSString *Discount;
/**购买人数*/
@property(nonatomic, copy) NSString *Buycount;
/**标题缩写*/
@property(nonatomic, copy) NSString *Abbreviation;
/**商品描述*/
@property(nonatomic, copy) NSString *GoodsIntro;
/**商品ID*/
@property(nonatomic, copy) NSString *GoodsId;
/**品牌图标*/
@property(nonatomic, copy) NSString *ShopImage;
/**品牌名称*/
@property(nonatomic, copy) NSString *BrandCNName;
/**品牌ID*/
@property(nonatomic, copy) NSString *ShopId;
/**品牌国家名称*/
@property(nonatomic, copy) NSString *CountryName;
/**是否收藏*/
@property(nonatomic, copy) NSString *isCollected;
@end

NS_ASSUME_NONNULL_END
