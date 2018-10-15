//
//  RZZNavigationController.m
//  store
//
//  Created by 任志忠 on 2018/10/9.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZNavigationController.h"

@interface RZZNavigationController ()

@end

@implementation RZZNavigationController

//保证只执行一次，提升性能
+ (void)initialize
{
    //获取UINavigationBar
    UINavigationBar *navBar = [UINavigationBar appearance];
    //设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"nav_backImage"] forBarMetrics:UIBarMetricsDefault];
    //设置字号颜色
    [navBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20.0f],
                                     NSForegroundColorAttributeName:[UIColor blackColor]
                                     }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"详情界面返回按钮"] forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, 0, 30, 30);
        [btn addTarget:self action:@selector(returnViewController) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
        viewController.navigationItem.leftBarButtonItem = item;
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)returnViewController {
    [self popViewControllerAnimated:YES];
}

@end
