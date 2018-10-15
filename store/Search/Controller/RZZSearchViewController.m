//
//  RZZSearchViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZSearchViewController.h"
#import "RZZGoodsListViewController.h"
#import "RZZSearchResultModel.h"
#import <MJExtension.h>


@interface RZZSearchViewController ()<UISearchBarDelegate>

/**搜索框*/
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation RZZSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBackItem];
    self.navigationItem.titleView = _searchBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.searchBar becomeFirstResponder];
}

- (void)addBackItem {
    self.navigationItem.leftBarButtonItem = nil;
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = item;
}

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH - 40, 25)];
        _searchBar.placeholder = @"商品名/功效/品牌";
        _searchBar.showsCancelButton = YES;
        _searchBar.delegate = self;
        self.navigationItem.titleView = _searchBar;
    }
    return _searchBar;
}

#pragma mark - SearchBarDelegate
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}


/**
 搜索

 @param searchBar <#searchBar description#>
 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    //模拟1秒网络请求
    [searchBar resignFirstResponder];
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:0.3];
        NSArray *dataArray = @[
                                 @{@"Abbreviation":@"这个是商品描述1",@"Title":@"商品1",@"DomesticPrice":@"￥100",@"Price":@"10",@"GoodsId":@"10001",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述2",@"Title":@"商品2",@"DomesticPrice":@"￥200",@"Price":@"20",@"GoodsId":@"10002",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述3",@"Title":@"商品3",@"DomesticPrice":@"￥300",@"Price":@"30",@"GoodsId":@"10003",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述4",@"Title":@"商品4",@"DomesticPrice":@"￥400",@"Price":@"40",@"GoodsId":@"10004",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述5",@"Title":@"商品5",@"DomesticPrice":@"￥500",@"Price":@"50",@"GoodsId":@"10005",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述6",@"Title":@"商品6",@"DomesticPrice":@"￥600",@"Price":@"60",@"GoodsId":@"10006",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述7",@"Title":@"商品7",@"DomesticPrice":@"￥700",@"Price":@"70",@"GoodsId":@"10007",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述8",@"Title":@"商品8",@"DomesticPrice":@"￥800",@"Price":@"80",@"GoodsId":@"10008",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"},
                                 @{@"Abbreviation":@"这个是商品描述9",@"Title":@"商品9",@"DomesticPrice":@"￥900",@"Price":@"90",@"GoodsId":@"10009",@"CountryImg":@"https://gss3.bdstatic.com/-Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike116%2C5%2C5%2C116%2C38/sign=ed806ef47ad98d1062d904634056d36b/8d5494eef01f3a29eea82dc69f25bc315c607c52.jpg",@"ImgView":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg"}
                                 ];
        NSArray *resultArray = [RZZSearchResultModel mj_objectArrayWithKeyValuesArray:dataArray];
        //返回主线程执行操作
        dispatch_async(dispatch_get_main_queue(), ^{
            RZZGoodsListViewController *goodsList = [[RZZGoodsListViewController alloc] init];
            goodsList.title = searchBar.text;
            goodsList.listArray = resultArray;
            [self.navigationController pushViewController:goodsList animated:YES];
            RZZLog(@"%@", resultArray);
        });
        
    });

}

//模拟网络请求2秒钟

@end
