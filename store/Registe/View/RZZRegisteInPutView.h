//
//  RZZRegisteInPutView.h
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^nextBtnBlock)(NSDictionary *dict);

@interface RZZRegisteInPutView : UIView

@property (nonatomic, copy) nextBtnBlock nextBlock;
@end

NS_ASSUME_NONNULL_END
