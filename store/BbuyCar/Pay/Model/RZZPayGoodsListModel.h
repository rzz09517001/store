//
//  RZZPayGoodsListModel.h
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZPayGoodsListModel : NSObject

/**商品ID*/
@property (copy, nonatomic) NSString *GoodsId;
/**商品缩略图*/
@property (copy, nonatomic) NSString *ImgView;
/**商品标题*/
@property (copy, nonatomic) NSString *Title;
/**商品数量*/
@property (assign, nonatomic) NSInteger GoodsCount;
/**价格*/
@property (assign, nonatomic) CGFloat Price;
/**商品重量*/
@property (assign, nonatomic) CGFloat Weight;

@end

NS_ASSUME_NONNULL_END
