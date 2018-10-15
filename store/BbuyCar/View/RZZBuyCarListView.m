//
//  RZZBuyCarListView.m
//  store
//
//  Created by 任志忠 on 2018/10/14.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZBuyCarListView.h"
#import "RZZBuyCarTableViewCell.h"
#import "RZZBuyCarModel.h"

@interface RZZBuyCarListView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RZZBuyCarListView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

-(void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    for (RZZBuyCarModel *model in _dataArray) {
        model.isSelectButton = YES;
    }
    [self reloadData];
}

#pragma mark - DataSouces
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

- (RZZBuyCarTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"buuCarCell";
    RZZBuyCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[RZZBuyCarTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    };
    cell.model = self.dataArray[indexPath.row];
    cell.tag = 1000 + indexPath.row;
    [cell.addBtn addTarget:self action:@selector(addButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [cell.cutBtn addTarget:self action:@selector(cutButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    [cell.isSelectBtn addTarget:self action:@selector(selectButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *dele = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        RZZBuyCarModel *model = _dataArray[indexPath.row];
        [model setGoodsCount:0];
        [self changeData];
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    return @[dele];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)addButtonMethod:(UIButton *)sender {
    UIView *cell = [sender superview];
    NSInteger cellTag = cell.tag - 1000;
    RZZBuyCarModel *model = _dataArray[cellTag];
    [model setGoodsCount:(model.GoodsCount + 1)];
    [self changeData];
}

- (void)cutButtonMethod:(UIButton *)sender {
    UIView *cell = [sender superview];
    NSInteger cellTag = cell.tag - 1000;
    RZZBuyCarModel *model = _dataArray[cellTag];
    if (model.GoodsCount > 1) {
        [model setGoodsCount:(model.GoodsCount -1)];
    }
    [self changeData];
}

- (void)selectButtonMethod:(UIButton *)sender {
    UIView *cell = [sender superview];
    NSInteger cellTag = cell.tag - 1000;
    RZZBuyCarModel *model = _dataArray[cellTag];
    if(sender.selected) {
        sender.selected = NO;
        [model setIsSelectButton:NO];
    } else {
        sender.selected = YES;
        [model setIsSelectButton:YES];
    }
    [self changeData];
}

-(void)changeData {
    [self reloadData];
    if (_changeDataBlock) {
        _changeDataBlock();
    }
}
@end
