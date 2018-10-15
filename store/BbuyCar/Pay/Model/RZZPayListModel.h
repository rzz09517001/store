//
//  RZZPayListModel.h
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZPayListModel : NSObject

/**支付方式*/
@property (copy, nonatomic) NSString *Distribution;
/**支付名字*/
@property (copy, nonatomic) NSString *DistributionName;

@end

NS_ASSUME_NONNULL_END
