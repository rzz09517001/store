//
//  RZZMyListTableView.m
//  store
//
//  Created by 任志忠 on 2018/10/10.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZMyListTableView.h"
#import "RZZMyListTableViewCell.h"

@interface RZZMyListTableView()<UITableViewDelegate, UITableViewDataSource>

/**列表数据*/
@property (nonatomic, strong) NSArray *listArray;

@end

@implementation RZZMyListTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.backgroundColor = MainColor;
    }
    return self;
}

- (NSArray *)listArray {
    if (!_listArray) {
        _listArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"RZZMyListTableCell" ofType:@"plist"]];
    }
    return _listArray;
}

#pragma mark - datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    if (dic.count) {
        return 6;
    } else {
        return 4;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cell";
    RZZMyListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[RZZMyListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        if (indexPath.row == 3) {
            UIImageView *imageView = [cell valueForKey:@"nextImage"];
            imageView.hidden = YES;
            UILabel *phone = [[UILabel alloc] init];
            phone.textColor = RGB(123, 124, 128);
            phone.text = @"400-820-8820";
            [cell addSubview:phone];
            
            __weak __typeof (cell) weakSelf = cell;
            [phone mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(120, 15));
                make.right.equalTo(weakSelf.mas_right).offset(-15);
                make.centerY.equalTo(weakSelf.mas_centerY);
            }];
        }
    }
    cell.dic = self.listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"我选中的是第%li行",indexPath.row);
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    if (dic.count) {
        UIView *footerView = [[UIView alloc] init];
        footerView.backgroundColor = MainColor;
        UIButton *loginOutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loginOutBtn setImage:[UIImage imageNamed:@"我的界面退出登录按钮"] forState:UIControlStateNormal];
        [loginOutBtn addTarget:self action:@selector(loginOutMethod) forControlEvents:UIControlEventTouchUpInside];
        [footerView addSubview:loginOutBtn];
        [loginOutBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(footerView.mas_left).offset(50);
            make.right.equalTo(footerView.mas_right).offset(-50);
            make.top.equalTo(footerView.mas_top).offset(42);
            make.height.mas_equalTo(45);
        }];
        return footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

#pragma mark - loginOut
- (void) loginOutMethod {
    if (_loginOutBlock) {
        _loginOutBlock();
    }
}
@end
