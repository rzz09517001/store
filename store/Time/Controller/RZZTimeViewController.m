//
//  RZZTimeViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/9.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZTimeViewController.h"
#import <SDCycleScrollView.h>
#import "RZZSigleListModel.h"
#import <MJExtension.h>
#import "RZZGroupListModel.h"
#import "RZZTimeTableView.h"
#import "RZZCenterButtonView.h"
#import "RZZDetailViewController.h"
#import "RZZSearchViewController.h"

@interface RZZTimeViewController ()<UIScrollViewDelegate, SDCycleScrollViewDelegate>

/**最底层滑动*/
@property (nonatomic, strong) UIScrollView *mainScroll;
/**临时代替轮播图位置*/
@property (nonatomic, strong) SDCycleScrollView *headImageView;
/**中间按钮底部view*/
@property (nonatomic, strong) RZZCenterButtonView *twoButtonView;
/**tableView*/
@property (nonatomic, strong) RZZTimeTableView *singleTableView;
/**第二个*/
@property (nonatomic, strong) RZZTimeTableView *groupTabelView;

/**存放tableView数据*/
@property (nonatomic, strong) NSArray *singleArray;
/**存放fgroupTableView*/
@property (nonatomic, strong) NSArray *groupArray;
@end

@implementation RZZTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //不让view延生到整个屏幕
    self.view.backgroundColor = MainColor;
    [self.view addSubview:self.mainScroll];
    [self.mainScroll addSubview:self.headImageView];
    [self.mainScroll addSubview:self.singleTableView];
    [self.mainScroll addSubview:self.groupTabelView];
    [self.mainScroll addSubview:self.twoButtonView];
    [self addSearchBtn];
    [self requestHederViewImage];
    [self requestNewStore];
    [self requestGroupStore];
}

- (UIScrollView *)mainScroll {
    if (!_mainScroll) {
        _mainScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT- 64)];
        _mainScroll.contentSize = CGSizeMake(0, 1980);
        _mainScroll.bounces = NO;
        _mainScroll.delegate = self;
    }
    return _mainScroll;
}

- (SDCycleScrollView *)headImageView {
    if (!_headImageView) {
        _headImageView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 230) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        //page居右
        _headImageView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _headImageView.pageDotColor = [UIColor whiteColor];
        _headImageView.currentPageDotColor = [UIColor blueColor];
    }
    return _headImageView;
}

- (RZZCenterButtonView *)twoButtonView {
    if (!_twoButtonView) {
        _twoButtonView = [[RZZCenterButtonView alloc] initWithFrame:CGRectMake(0, 230, VIEW_WIDTH, 50)];
        _twoButtonView.backgroundColor = [UIColor whiteColor];
        [_twoButtonView.newProBtn addTarget:self action:@selector(changeTableFrame:) forControlEvents:UIControlEventTouchUpInside];
        [_twoButtonView.hotProBtn addTarget:self action:@selector(changeTableFrame:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _twoButtonView;
}

- (RZZTimeTableView *)singleTableView {
    if (!_singleTableView) {
        _singleTableView = [[RZZTimeTableView alloc] initWithFrame:CGRectMake(0, 280, VIEW_WIDTH, 1700) style:UITableViewStylePlain];
        _singleTableView.isSingleTabelView = YES;
        __weak __typeof(self) weakSelf = self;
        _singleTableView.tableSelectedBlock = ^(RZZSigleListModel * _Nonnull model) {
            RZZDetailViewController *detailVC = [[RZZDetailViewController alloc] init];
            detailVC.id = model.id;
            [weakSelf.navigationController pushViewController:detailVC animated:YES];
        };
    }
    return _singleTableView;
}

- (RZZTimeTableView *)groupTabelView {
    if (!_groupTabelView) {
        _groupTabelView = [[RZZTimeTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 280, VIEW_WIDTH, 1700) style:UITableViewStylePlain];
        _groupTabelView.isSingleTabelView = NO;
    }
    return _groupTabelView;
}

- (void)addSearchBtn {
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setImage:[UIImage imageNamed:@"限时特卖界面搜索按钮"] forState:UIControlStateNormal];
    searchBtn.frame = CGRectMake(0, 0, 35, 35);
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = item;
    [searchBtn addTarget:self action:@selector(pushSearchView) forControlEvents:UIControlEventTouchUpInside];
}

-(void)pushSearchView {
    RZZSearchViewController *searchVC = [[RZZSearchViewController alloc] init];
    [self.navigationController pushViewController:searchVC animated:YES];
}

-(void) changeTableFrame:(UIButton *) buttton {
    if (buttton == _twoButtonView.newProBtn) {
        _twoButtonView.newProBtn.selected = YES;
        _twoButtonView.hotProBtn.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect1 = _singleTableView.frame;
            CGRect rect2 = _groupTabelView.frame;
            rect1.origin.x = 0;
            rect2.origin.x = VIEW_WIDTH;
            _singleTableView.frame = rect1;
            _groupTabelView.frame = rect2;
            _mainScroll.contentSize = CGSizeMake(0, self.singleArray.count * 170 + 280);
        }];
    } else {
        _twoButtonView.newProBtn.selected = NO;
        _twoButtonView.hotProBtn.selected = YES;
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect1 = _singleTableView.frame;
            CGRect rect2 = _groupTabelView.frame;
            rect1.origin.x = -VIEW_WIDTH;
            rect2.origin.x = 0;
            _singleTableView.frame = rect1;
            _groupTabelView.frame = rect2;
            _mainScroll.contentSize = CGSizeMake(0, self.groupArray.count * 200 + 280);
        }];
    }
}

#pragma mark - scrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y >230) {
        CGRect rect = self.twoButtonView.frame;
        rect.origin.y = scrollView.contentOffset.y;
        self.twoButtonView.frame = rect;
    } else {
        CGRect rect = self.twoButtonView.frame;
        rect.origin.y = 230;
        self.twoButtonView.frame = rect;
    }
}

/**请求网络图片*/
- (void)requestHederViewImage {
    [self getData:@"/action/apiv2/banner" param:@{@"catalog":@"1"} success:^(id  _Nonnull responseObject) {
        if ([responseObject[@"code"] integerValue] == 1) {
            NSDictionary *dic = responseObject[@"result"];
            NSArray *info = dic[@"items"];
            NSMutableArray *imageURLArray = [NSMutableArray arrayWithCapacity:0];
            for (NSDictionary *dic1 in info) {
                NSString *url = dic1[@"img"];
                [imageURLArray addObject:url];
            }
            _headImageView.imageURLStringsGroup = imageURLArray;
        }
    } error:^(NSError * _Nonnull error) {
        
    }];
}


/**
 请求新品数据
 */
- (void)requestNewStore {
    [self getData:@"/action/apiv2/event" param:@{} success:^(id  _Nonnull responseObject) {
        NSDictionary *dic = responseObject[@"result"];
        self.singleArray = [RZZSigleListModel mj_objectArrayWithKeyValuesArray:dic[@"items"]];
        CGRect frame = _singleTableView.frame;
        frame.size.height = self.singleArray.count * 170;
        _singleTableView.frame = frame;
        if (_twoButtonView.newProBtn.selected) {
            _mainScroll.contentSize = CGSizeMake(0, self.singleArray.count * 170 + 280);
        }
        _singleTableView.singleArray = self.singleArray;
    } error:^(NSError * _Nonnull error) {
        
    }];
}


/**
 请求品牌数据
 */
- (void)requestGroupStore {
    [self getData:@"/action/apiv2/event" param:@{} success:^(id  _Nonnull responseObject) {
        NSDictionary *dic = responseObject[@"result"];
        self.groupArray = [RZZGroupListModel mj_objectArrayWithKeyValuesArray:dic[@"items"]];
        CGRect frame = _groupTabelView.frame;
        frame.size.height = self.groupArray.count * 200;
        _groupTabelView.frame = frame;
        if (_twoButtonView.hotProBtn.selected) {
            _mainScroll.contentSize = CGSizeMake(0, self.groupArray.count * 200 + 280);
        }
        _groupTabelView.groupArray = self.groupArray;
    } error:^(NSError * _Nonnull error) {
        
    }];
}
@end
