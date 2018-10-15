//
//  RZZPriceView.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^gotoInsertBlock)(void);
@interface RZZPriceView : UIView

/**价格*/
@property (nonatomic, strong) UILabel *priceLabel;

/**blcok*/
@property(nonatomic, copy) gotoInsertBlock gotoInsert;

@end

NS_ASSUME_NONNULL_END
