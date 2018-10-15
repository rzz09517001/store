//
//  RZZGoodsListView.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^selectedCellGoodsIdBlock)(NSString *goodsId);

@interface RZZGoodsListView : UICollectionView

/**数据参数*/
@property (nonatomic, strong) NSArray *dataArray;
/**block*/
@property(nonatomic, copy) selectedCellGoodsIdBlock selectedBlock;

@end

NS_ASSUME_NONNULL_END
