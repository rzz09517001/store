//
//  RZZDetailImageModel.h
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZDetailImageModel : NSObject

/**id*/
@property(nonatomic, copy) NSString *id;

/**链接*/
@property(nonatomic, copy) NSString *href;

/**图片*/
@property(nonatomic, copy) NSString *img;

/**图片尺寸*/
@property(nonatomic, copy) NSString *resolution;

@end

NS_ASSUME_NONNULL_END
