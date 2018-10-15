//
//  RZZSigleListModel.h
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RZZSigleListModel : NSObject

/**标题*/
@property(nonatomic, copy) NSString *title;
/**详情*/
@property(nonatomic, copy) NSString *body;
/**id*/
@property(nonatomic, copy) NSString *id;
/**图片*/
@property(nonatomic, copy) NSString *img;
/**状态*/
@property(nonatomic, copy) NSString *status;
/**类别*/
@property(nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
