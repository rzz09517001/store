//
//  RZZMyHeaderView.h
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RegisteBtnBlock)(void);
typedef void(^LoginBtnBlock)(void);

@interface RZZMyHeaderView : UIView

@property (nonatomic, copy) RegisteBtnBlock registeBlock;
@property (nonatomic, copy) LoginBtnBlock loginBlock;

-(void)reloadHederView;

@end

NS_ASSUME_NONNULL_END
