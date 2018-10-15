//
//  RZZThirdLoginView.h
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^qqLoginBlock)(void);

@interface RZZThirdLoginView : UIView

@property(nonatomic, copy) qqLoginBlock qqBlock;

@end

NS_ASSUME_NONNULL_END
