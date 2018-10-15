//
//  RZZDetailViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/13.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZDetailViewController.h"
#import "RZZDetailHeaderView.h"
#import "RZZDetailImageModel.h"
#import <MJExtension.h>
#import "RZZDetailTitleLabelView.h"
#import "RZZDetailTitleModel.h"
#import "RZZDetailContentModel.h"
#import "RZZDetailContentView.h"
#import "RZZBottomImageView.h"
#import "RZZDetailTabBarView.h"

@interface RZZDetailViewController ()<UIScrollViewDelegate>

/**scrollView*/
@property (nonatomic, strong) UIScrollView *mainScrollView;
/**Header*/
@property (nonatomic, strong) RZZDetailHeaderView *headerView;
/**detailView*/
@property (nonatomic, strong) RZZDetailTitleLabelView *titleLabelView;
/**内容页*/
@property (nonatomic, strong) RZZDetailContentView *contentView;
/**底部view*/
@property (nonatomic, strong) RZZBottomImageView *bottomImageView;
/**存储scrollContentSize的范围*/
@property(nonatomic, assign) CGFloat scrollContentSizeHeight;
/**底部tab*/
@property (nonatomic, strong) RZZDetailTabBarView *tabBarView;

@end

@implementation RZZDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollContentSizeHeight = 300.0;
    self.edgesForExtendedLayout= 0 ;
    [self.view addSubview:self.mainScrollView];
    [self.mainScrollView addSubview:self.headerView];
    [self.mainScrollView addSubview:self.titleLabelView];
    [self.mainScrollView addSubview:self.contentView];
    [self.mainScrollView addSubview:self.bottomImageView];
    [self.view addSubview:self.tabBarView];
    __weak __typeof(self) weakSelf = self;
    [_mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view).with.insets(UIEdgeInsetsMake(0, 0, 45, 0));
    }];
    [_titleLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.headerView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
        make.height.mas_equalTo(300);
    }];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.titleLabelView.mas_bottom);
        make.left.right.equalTo(weakSelf.view);
    }];
    [_bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(weakSelf.view);
        make.top.equalTo(weakSelf.contentView.mas_bottom);
    }];
    [self requestHederViewImage];
    [self requestTitleData];
    [self requestContentData];
}

- (UIScrollView *)mainScrollView {
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] init];
        _mainScrollView.delegate = self;
        _mainScrollView.bounces = NO;
        _mainScrollView.contentSize = CGSizeMake(0, 2000);
    }
    return _mainScrollView;
}

- (RZZDetailHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[RZZDetailHeaderView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 300)];
    }
    return _headerView;
}

- (RZZDetailTitleLabelView *)titleLabelView {
    if (!_titleLabelView) {
        _titleLabelView = [[RZZDetailTitleLabelView alloc] init];
        __weak typeof(self) weakSelf = self;
        _titleLabelView.returnHeightBlock = ^(CGFloat height) {
            [weakSelf.titleLabelView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
                weakSelf.scrollContentSizeHeight += height;
            }];
        };
    }
    return _titleLabelView;
}

- (RZZDetailContentView *)contentView {
    if (!_contentView) {
        _contentView = [[RZZDetailContentView alloc] init];
        __weak typeof(self) weakSelf = self;
        _contentView.returnHeightBlock = ^(CGFloat height) {
            [weakSelf.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
                weakSelf.scrollContentSizeHeight += height;
            }];
        };
    }
    return _contentView;
}

- (RZZBottomImageView *)bottomImageView {
    if (!_bottomImageView) {
        _bottomImageView = [[RZZBottomImageView alloc] init];
        __weak typeof(self) weakSelf = self;
        _bottomImageView.heightBlock = ^(CGFloat height) {
            [weakSelf.bottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(height);
                weakSelf.scrollContentSizeHeight += height;
            }];
        };
    }
    return _bottomImageView;
}

- (RZZDetailTabBarView *)tabBarView {
    if (!_tabBarView) {
        _tabBarView = [[RZZDetailTabBarView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT - 109, VIEW_WIDTH, 45)];
        __weak typeof(self) weakSelf = self;
        _tabBarView.addBlock = ^{
            [weakSelf addGoodsInBuyCar];
        };
    }
    return _tabBarView;
}

- (void)setScrollContentSizeHeight:(CGFloat)scrollContentSizeHeight {
    _scrollContentSizeHeight = scrollContentSizeHeight;
    self.mainScrollView.contentSize = CGSizeMake(0, scrollContentSizeHeight);
}

/**请求网络图片*/
- (void)requestHederViewImage {
    [self getData:@"/action/apiv2/banner" param:@{@"catalog":@"1"} success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 1) {
            NSDictionary *dic = responseObject[@"result"];
            NSArray *info = dic[@"items"];
            NSMutableArray *imageURLArray = [NSMutableArray arrayWithCapacity:0];
            NSArray *modelArray = [RZZDetailImageModel mj_objectArrayWithKeyValuesArray:info];
            for (RZZDetailImageModel *model in modelArray) {
                NSString *url = model.img;
                [imageURLArray addObject:url];
            }
            _headerView.imageArray = imageURLArray;
            /**id*/
            NSArray *imageArray = @[@{@"id":@"1",@"img":@"https://img12.360buyimg.com/cms/jfs/t26494/186/1069111756/123237/8b7cd976/5bc05e9eN1f744194.jpg",@"resolution":@"660*200"},
                                    @{@"id":@"2",@"img":@"https://img10.360buyimg.com/popWaterMark/jfs/t22888/131/687342318/392392/bf0a6121/5b3dd326N4ffad05e.jpg",@"resolution":@"790*625"},
                                    @{@"id":@"3",@"img":@"https://img20.360buyimg.com/popWaterMark/jfs/t20935/338/1924185712/389344/97e56f2e/5b3dd325N5f569a00.jpg",@"resolution":@"790*613"},
                                    @{@"id":@"4",@"img":@"https://img13.360buyimg.com/popWaterMark/jfs/t24538/155/700878696/430287/d991dfba/5b3dd326N76e8104b.jpg",@"resolution":@"790*615"},
                                    @{@"id":@"5",@"img":@"https://img11.360buyimg.com/popWaterMark/jfs/t23041/130/687893954/454733/6782e842/5b3dd326N15cb0482.jpg",@"resolution":@"790*628"},
                                    @{@"id":@"6",@"img":@"https://img14.360buyimg.com/popWaterMark/jfs/t21736/332/1863499503/350366/f057d35a/5b3dd326N4a8146fb.jpg",@"resolution":@"789*697"},
                                    ];
            NSArray *bootomModelArray = [RZZDetailImageModel mj_objectArrayWithKeyValuesArray:imageArray];
            _bottomImageView.imageArray = bootomModelArray;
        }
    } error:^(NSError * _Nonnull error) {
        
    }];
}

- (void)requestTitleData {
    //模拟网络请求2秒钟
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSDictionary *dic = @{@"Abbreviation":@"韩国 Beyond 迪士尼爱丽丝梦游仙境 2016限量保湿气垫霜",
                              @"GoodsId":@"10086",
                              @"Price":@"7.0",
                              @"OriginalPrice":@"￥300",
                              @"Discount":@"0.2",
                              @"BrandCNName":@"LG生活健康",
                              @"CountryName":@"韩国",
                              @"Buycount":@"58",
                              @"GoodsIntro":@"巴黎欧莱雅（L'OREAL PARIS）是欧莱雅集团里知名度最高、历史最悠久的大众化妆品品牌之一，主要生产染发护发、彩妆及护肤产品，其出众的品质一直倍受全球爱美女性的青睐。",
                              @"ShopImage":@"https://gss1.bdstatic.com/9vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=b46987af1738534398c28f73f27adb1b/738b4710b912c8fc428d820efb039245d78821f2.jpg",
                              @"ShopId":@"9527",
                              @"isCollected":@"1"
                              };
        RZZDetailTitleModel *titleModel = [RZZDetailTitleModel mj_objectWithKeyValues:dic];
        dispatch_async(dispatch_get_main_queue(), ^{
            _titleLabelView.model = titleModel;
        });
        
    });
}

/**请求详细数据*/
- (void)requestContentData {
    //模拟网络请求2秒钟
    dispatch_queue_t queue= dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSArray *data = @[@{@"title":@"商品名称",@"Value":@"【国内专柜】丝塔芙Cetaphil保湿润肤乳473ml"},
                               @{@"title":@"品   牌",@"Value":@"丝塔芙"},
                               @{@"title":@"产品规格",@"Value":@"473ml/瓶"},
                               @{@"title":@"功   效",@"Value":@"抗氧化 保湿 缩小毛孔 敏感肌 滋润"},
                               @{@"title":@"适用人群",@"Value":@"敏感性肤质"},
                               @{@"title":@"原产地区",@"Value":@"法国"},
                               @{@"title":@"保质期限",@"Value":@"3年"}];
        NSArray *models = [RZZDetailContentModel mj_objectArrayWithKeyValuesArray:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            _contentView.contentArray = models;
        });
        
    });
}

/**
 加入购物车
 */
-(void)addGoodsInBuyCar {
    NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] valueForKey:@"userInfo"];
    if (userInfo.count > 0) {
        //执行网络请求
    } else {
        //跳转到登陆页面
    }
}
@end
