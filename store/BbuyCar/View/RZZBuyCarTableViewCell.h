//
//  RZZBuyCarTableViewCell.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZBuyCarModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RZZBuyCarTableViewCell : UITableViewCell

/**model*/
@property (nonatomic, strong) RZZBuyCarModel *model;

/**增加商品个数*/
@property (nonatomic, strong) UIButton *addBtn;
/**减少商品个数*/
@property (nonatomic, strong) UIButton *cutBtn;
/**是否选中*/
@property (nonatomic, strong) UIButton *isSelectBtn;

@end

NS_ASSUME_NONNULL_END
