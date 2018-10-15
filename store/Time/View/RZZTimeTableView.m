//
//  RZZTimeTableView.m
//  store
//
//  Created by 任志忠 on 2018/10/12.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZTimeTableView.h"
#import "RZZSingleTableViewCell.h"
#import "RZZGroupTableViewCell.h"

@interface RZZTimeTableView()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation RZZTimeTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
    }
    return self;
}

- (void)setSingleArray:(NSArray *)singleArray {
    _singleArray = singleArray;
    [self reloadData];
}

- (void)setGroupArray:(NSArray *)groupArray {
    _groupArray = groupArray;
    [self reloadData];
}
#pragma mark - tableViewDatasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isSingleTabelView) {
        return [self.singleArray count] > 0 ? [self.singleArray count] : 10;
    } else {
        return [self.groupArray count] > 0 ? [self.groupArray count] : 10;
        }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isSingleTabelView) {
        return 170;
    } else {
        return 200;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isSingleTabelView) {
        RZZSingleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"singleCell"];
        if (!cell) {
            cell = [[RZZSingleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"singleCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.singleModel = self.singleArray[indexPath.row];
        return cell;
    } else {
        RZZGroupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"groupCell"];
        if (!cell) {
            cell = [[RZZGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"groupCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageUrl = [self.groupArray[indexPath.row] img];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isSingleTabelView) {
        if (_tableSelectedBlock) {
            _tableSelectedBlock(self.singleArray[indexPath.row]);
        }
    } else {
        
    }
}
@end
