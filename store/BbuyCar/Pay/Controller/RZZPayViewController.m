//
//  RZZPayViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/15.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZPayViewController.h"
#import "RZZPayGoodsListView.h"
#import "RZZPayAddressView.h"

@interface RZZPayViewController ()

/**地址*/
@property (nonatomic, strong) RZZPayAddressView *addrassView;
/**tableView*/
@property (nonatomic, strong) RZZPayGoodsListView *tableView;

@end

@implementation RZZPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.addrassView];
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addrassView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
}

- (RZZPayAddressView *)addrassView {
    if (!_addrassView) {
        _addrassView = [[RZZPayAddressView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 80)];
    }
    return _addrassView;
}

- (RZZPayGoodsListView *)tableView {
    if (!_tableView) {
        _tableView = [[RZZPayGoodsListView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tableView.orderList = self.dataArray;
    }
    return _tableView;
}

@end
