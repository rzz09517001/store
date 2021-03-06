//
//  RZZPayModel.h
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZPayModel : NSObject

/**商品个数*/
@property (copy, nonatomic) NSString *Count;

/**邮费*/
@property (copy, nonatomic) NSString *DeliverCost;

/**支付方式列表*/
@property (strong, nonatomic) NSArray *PayList;

/**订单中商品列表*/
@property (strong, nonatomic) NSArray *GoodsList;
/**订单金额*/
@property (copy, nonatomic) NSString *GoodsPrice;
/**返回信息*/
@property (copy, nonatomic) NSString *Message;
/**是否成功*/
@property (copy, nonatomic) NSString *result;


@end

NS_ASSUME_NONNULL_END
