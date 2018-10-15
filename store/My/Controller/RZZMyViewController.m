//
//  RZZMyViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/9.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZMyViewController.h"
#import "RZZMyListTableView.h"
#import "RZZMyHeaderView.h"
#import "RZZRegisteViewController.h"
#import "RZZLoginViewController.h"
#import <Masonry.h>

@interface RZZMyViewController ()
/**顶部登录与注册view*/
@property (nonatomic, strong) RZZMyHeaderView *headView;
/**功能列表*/
@property (nonatomic, strong) RZZMyListTableView *listTableView;

@end

@implementation RZZMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //允许自动布局
    self.edgesForExtendedLayout = 0;
    self.view.backgroundColor = MainColor;
    [self.view addSubview:self.listTableView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    RZZLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"]);
    [self.listTableView reloadData];
    [self.headView reloadHederView];
}


- (RZZMyHeaderView *)headView
{
    if (!_headView) {
        _headView = [[RZZMyHeaderView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 160)];
        __weak __typeof(self) weakSelf = self;
        _headView.registeBlock = ^(void){
            RZZRegisteViewController *registeViewController = [[RZZRegisteViewController alloc] init];
            [weakSelf.navigationController pushViewController:registeViewController animated:YES];
        };
        _headView.loginBlock = ^{
            RZZLoginViewController *loginViewController = [[RZZLoginViewController alloc] init];
            [weakSelf.navigationController pushViewController:loginViewController animated:YES];
        };
    }
    return _headView;
}

- (RZZMyListTableView *)listTableView
{
    if (!_listTableView) {
        _listTableView = [[RZZMyListTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT) style:UITableViewStylePlain];
        __weak __typeof(self)weakSelf = self;
        _listTableView.loginOutBlock = ^{
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userInfo"];
            [weakSelf.listTableView reloadData];
            [weakSelf.headView reloadHederView];
        };
        _listTableView.tableHeaderView = self.headView;
    }
    return _listTableView;
}

@end
