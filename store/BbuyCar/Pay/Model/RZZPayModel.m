//
//  RZZPayModel.m
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPayModel.h"
#import <MJExtension.h>

@implementation RZZPayModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{
             @"PayList":@"RZZPayListModel",
             @"GoodsList":@"RZZPayGoodsListModel"
             };
}

@end
