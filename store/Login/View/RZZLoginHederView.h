//
//  RZZLoginHederView.h
//  store
//
//  Created by 任志忠 on 2018/10/11.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^LoginMethodBlock)(NSDictionary *dict);
typedef void (^RegisteMethodBlock)(void);

@interface RZZLoginHederView : UIView

@property (nonatomic, copy) LoginMethodBlock loginBlock;
@property (nonatomic, copy) RegisteMethodBlock registeBlock;

@end

NS_ASSUME_NONNULL_END
