//
//  RZZPayGoodsListTableViewCell.h
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZPayGoodsListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RZZPayGoodsListTableViewCell : UITableViewCell

/**接受数据*/
@property (nonatomic, strong) RZZPayGoodsListModel *model;

@end

NS_ASSUME_NONNULL_END
