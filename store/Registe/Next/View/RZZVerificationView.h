//
//  RZZVerificationView.h
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^registeBtnBlock)(NSString *code);

@interface RZZVerificationView : UIView

/**电话号码*/
@property (nonatomic, strong) NSString *phoneNum;
/**注册回调Block*/
@property(nonatomic, copy) registeBtnBlock registeBlock;
- (void)GCDTime;
@end

NS_ASSUME_NONNULL_END
