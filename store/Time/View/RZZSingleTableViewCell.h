//
//  RZZSingleTableViewCell.h
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZSigleListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RZZSingleTableViewCell : UITableViewCell

/**数据*/
@property (nonatomic, strong) RZZSigleListModel *singleModel;

@end

NS_ASSUME_NONNULL_END
