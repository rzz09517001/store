//
//  RZZGoodsListCollectionViewCell.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZSearchResultModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface RZZGoodsListCollectionViewCell : UICollectionViewCell

/**数据*/
@property (nonatomic, strong) RZZSearchResultModel *dataModel;

@end

NS_ASSUME_NONNULL_END
