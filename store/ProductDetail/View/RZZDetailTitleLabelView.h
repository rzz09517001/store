//
//  RZZDetailTitleLabelView.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RZZDetailTitleModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef void (^returnViewHeigtBlock)(CGFloat height);

@interface RZZDetailTitleLabelView : UIView

/**模型*/
@property (nonatomic, strong) RZZDetailTitleModel *model;
/**返回view的高度的block*/
@property(nonatomic, copy) returnViewHeigtBlock returnHeightBlock;

@end

NS_ASSUME_NONNULL_END
