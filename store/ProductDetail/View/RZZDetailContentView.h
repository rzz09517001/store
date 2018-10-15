//
//  RZZDetailContentView.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^returnContentViewHeightBlock)(CGFloat height);

@interface RZZDetailContentView : UIView

/**参数*/
@property(nonatomic, strong) NSArray *contentArray;
/**block*/
@property(nonatomic, copy) returnContentViewHeightBlock returnHeightBlock;

@end

NS_ASSUME_NONNULL_END
