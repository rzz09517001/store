//
//  RZZTimeTableView.h
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZSigleListModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^newTableSelectedBlock)(RZZSigleListModel *model);
@interface RZZTimeTableView : UITableView
/**是否是singleTableView*/
@property(nonatomic, assign) BOOL isSingleTabelView;

/**存放tableView数据*/
@property (nonatomic, strong) NSArray *singleArray;
/**存放fgroupTableView*/
@property (nonatomic, strong) NSArray *groupArray;
/**点击block*/
@property(nonatomic, copy) newTableSelectedBlock tableSelectedBlock;

@end

NS_ASSUME_NONNULL_END
