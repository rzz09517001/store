//
//  RZZGoodsListViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZGoodsListViewController.h"
#import "RZZGoodsListBarButtonView.h"
#import "RZZGoodsListView.h"
#import "RZZDetailViewController.h"

@interface RZZGoodsListViewController ()

/**顶部4个butoon页面*/
@property (nonatomic, strong) RZZGoodsListBarButtonView *fourBtnView;
/**商品列表*/
@property (nonatomic, strong) RZZGoodsListView *listView;
@end

@implementation RZZGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = 0;
    [self.view addSubview:self.fourBtnView];
    [self.view addSubview:self.listView];
    [_listView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.top.equalTo(self.fourBtnView.mas_bottom);
    }];
}

- (RZZGoodsListBarButtonView *)fourBtnView {
    if (!_fourBtnView) {
        _fourBtnView = [[RZZGoodsListBarButtonView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 30)];
        
    }
    return _fourBtnView;
}

- (RZZGoodsListView *)listView {
    if (!_listView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        NSInteger itemWidth = (VIEW_WIDTH-10)/2;
        flowLayout.itemSize = CGSizeMake(itemWidth,itemWidth/0.725);
        _listView = [[RZZGoodsListView alloc] initWithFrame:CGRectMake(0,0,0,0) collectionViewLayout:flowLayout];
        _listView.backgroundColor = MainColor;
        _listView.dataArray = self.listArray;
        __weak typeof(self) weakSelf = self;
        _listView.selectedBlock = ^(NSString * _Nonnull goodsId) {
            [weakSelf pushDetailViewController:goodsId];
        };
    }
    return _listView;
}

- (void)pushDetailViewController:(NSString *)goodsId {
    RZZDetailViewController *detailVC = [[RZZDetailViewController alloc] init];
    detailVC.id = goodsId;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
