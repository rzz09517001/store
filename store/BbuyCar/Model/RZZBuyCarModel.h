//
//  RZZBuyCarModel.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZBuyCarModel : NSObject

/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;
/**商品缩略图*/
@property (copy, nonatomic) NSString *ImgView;
/**商品标题*/
@property (copy, nonatomic) NSString *GoodsTitle;
/**商品数量*/
@property (assign, nonatomic) NSInteger GoodsCount;
/**价格*/
@property (assign, nonatomic) CGFloat Price;
/**是否选中*/
@property (assign, nonatomic,) BOOL isSelectButton;
/**商品标记*/
@property (copy, nonatomic) NSString *UUID;
/**商品重量*/
@property (assign, nonatomic) CGFloat Weight;

@end

NS_ASSUME_NONNULL_END
