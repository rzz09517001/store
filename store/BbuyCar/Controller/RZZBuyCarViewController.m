//
//  RZZBuyCarViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/9.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZBuyCarViewController.h"
#import "RZZBuyCarModel.h"
#import <MJExtension.h>
#import "RZZBuyCarListView.h"
#import "RZZPriceView.h"
#import "NSMutableAttributedString+RZZAttributePrice.h"
#import "RZZPayModel.h"//去结算Model
#import "RZZPayViewController.h"

@interface RZZBuyCarViewController ()

/**table*/
@property (nonatomic, strong) RZZBuyCarListView *listView;

/**价格总视图*/
@property (nonatomic, strong) RZZPriceView *priceView;

/**存储数据*/
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation RZZBuyCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dataInit];
    [self.view addSubview:self.listView];
    [self.view addSubview:self.priceView];
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self.view);
        make.height.mas_equalTo(55);
        make.bottom.equalTo(self.view.mas_bottom).offset(-49);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self requestBuyCarData];
}

- (void)dataInit {
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    [_dataArray addObjectsFromArray:@[@{@"GoodsId":@"1001",
                                        @"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg",
                                        @"GoodsTitle":@"我是商品1号",
                                        @"GoodsCount":@"4",
                                        @"Price":@"120",
                                        @"UUID":@"0FSWW-QWEQS-DWADASFADASDW"},
                                      @{@"GoodsId":@"1002",
                                        @"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg",
                                        @"GoodsTitle":@"我是商品2号",
                                        @"GoodsCount":@"1",
                                        @"Price":@"140",
                                        @"UUID":@"0FSWW-QWEQS-DWADASFADASDW"}
                                      ]];
}

- (RZZBuyCarListView *)listView {
    if (!_listView) {
        _listView = [[RZZBuyCarListView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStylePlain];
        __weak typeof(self) weakSelf = self;
        _listView.changeDataBlock = ^ {
            [weakSelf countPrice];
            [weakSelf changeBuyCarData];
        };
    }
    return _listView;
}

- (RZZPriceView *)priceView {
    if (!_priceView) {
        _priceView = [[RZZPriceView alloc] init];
        __weak typeof(self) weakSelf = self;
        _priceView.gotoInsert = ^{
            [weakSelf gotoInsertMethod];
        };
    }
    return _priceView;
}

- (void)countPrice {
    CGFloat allPrice = 0.0;
    for (RZZBuyCarModel *model in _dataArray) {
        if (model.isSelectButton) {
            allPrice += model.Price * model.GoodsCount;
        }
    }
    _priceView.priceLabel.attributedText = [NSMutableAttributedString makeAllPriceTetx:allPrice];
}

- (void)requestBuyCarData {
    NSDictionary *info = [[NSUserDefaults standardUserDefaults] valueForKey:@"userInfo"];
    if (info.count > 0) {
        //NSString *memberID = info[@"MemberId"];
        //网络请求，模拟数据
        _dataArray = [RZZBuyCarModel mj_objectArrayWithKeyValuesArray:self.dataArray];
        if (_dataArray.count > 0) {
            //购物车页面
            self.listView.dataArray = _dataArray;
            [self countPrice];
        } else {
            //空的
        }
    } else {
        RZZLog(@"未登陆");
    }
}

- (void)changeBuyCarData {
    NSString *buyCarData;
    NSMutableArray *buyCarDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (RZZBuyCarModel *model in _dataArray) {
        buyCarData = [NSString stringWithFormat:@"%@,%zd",model.UUID,model.GoodsCount];
        [buyCarDataArray addObject:buyCarData];
    }
    buyCarData = [buyCarDataArray componentsJoinedByString:@"#"];
    RZZLog(@"%@",buyCarData);
}

-(void)gotoInsertMethod {
    //拼接参数
    [self makegotoInsert];
    //发送网络请求,成功
    NSDictionary *dataDiction = @{@"result":@"right",
                                  @"message":@"",
                                  @"Count":@"2",
                                  @"DeliverCost":@"11.22",
                                  @"GoodsPrice":@"213.22",
                                  @"GoodsList":@[@{@"GoodsId":@"1001",
                                                     @"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg",
                                                     @"Title":@"我是商品1号",
                                                     @"GoodsCount":@"4",
                                                     @"Price":@"120",
                                                     @"Weight":@"12.1"},
                                                   @{@"GoodsId":@"1002",
                                                     @"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg",
                                                     @"Title":@"我是商品2号",
                                                     @"GoodsCount":@"1",
                                                     @"Price":@"140",
                                                     @"Weight":@"10.9"}],
                                                   @"PayList":@[@{@"Distribution":@"1",
                                                                  @"DistributionName":@"支付宝"
                                                                  }]
                                  };
    //转模型
    RZZPayModel *model = [RZZPayModel mj_objectWithKeyValues:dataDiction];
    if ([model.result isEqualToString:@"right"]) {
        RZZPayViewController *payVC = [[RZZPayViewController alloc] init];
        payVC.dataArray = model.GoodsList;
        [self.navigationController pushViewController:payVC animated:YES];
    } else {
        RZZLog(@"请求失败");
    }
    
}

-(NSDictionary *)makegotoInsert {
    NSString *buyCarData;
    NSMutableArray *buyCarDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (RZZBuyCarModel *model in _dataArray) {
        buyCarData = [NSString stringWithFormat:@"%zd,%@,%.2lf",model.GoodsCount,model.GoodsId,model.Weight];
        [buyCarDataArray addObject:buyCarData];
    }
    buyCarData = [buyCarDataArray componentsJoinedByString:@"#"];
    RZZLog(@"%@",buyCarData);
    return @{@"Goods":buyCarData};
}
@end
