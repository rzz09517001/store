//
//  RZZBuyCarListView.h
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^returnChangeDataBlock)(void);

@interface RZZBuyCarListView : UITableView

/**数据*/
@property(nonatomic, strong) NSMutableArray *dataArray;

/**block*/
@property(nonatomic, copy) returnChangeDataBlock changeDataBlock;

@end

NS_ASSUME_NONNULL_END
