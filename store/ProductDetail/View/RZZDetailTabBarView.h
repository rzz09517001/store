//
//  RZZDetailTabBarView.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^addBuyCarBlock)(void);

@interface RZZDetailTabBarView : UIView

/**block*/
@property(nonatomic, copy) addBuyCarBlock addBlock;

@end

NS_ASSUME_NONNULL_END
