//
//  RZZBottomImageView.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^returnHeightBlock)(CGFloat height);
@interface RZZBottomImageView : UIView

/**参数*/
@property (nonatomic, strong) NSArray *imageArray;

/**block*/
@property(nonatomic, copy) returnHeightBlock heightBlock;

@end

NS_ASSUME_NONNULL_END
