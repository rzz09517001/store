//
//  NSString+RZZStringHeight.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (RZZStringHeight)

+ (CGFloat)returnLabelTextHeight:(NSString *)text width:(CGFloat) width font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
