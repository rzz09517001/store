//
//  RZZPayGoodsListView.m
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPayGoodsListView.h"
#import "RZZPayGoodsListTableViewCell.h"

@interface RZZPayGoodsListView()<UITableViewDelegate, UITableViewDataSource>



@end

@implementation RZZPayGoodsListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame
                          style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

-(void)setOrderList:(NSArray *)orderList {
    _orderList = orderList;
    [self reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.orderList.count;
}

- (RZZPayGoodsListTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    RZZPayGoodsListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[RZZPayGoodsListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = self.orderList[indexPath.row];
    return cell;
}

@end
