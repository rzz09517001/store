//
//  RZZTabBarViewController.m
//  store
//
//  Created by 任志忠 on 2018/10/9.
//  Copyright © 2018 rzz. All rights reserved.
//

#import "RZZTabBarViewController.h"
#import "RZZNavigationController.h"

@interface RZZTabBarViewController ()

@property (nonatomic, strong) NSArray *viewControllerArray; //存放viewController

@end

@implementation RZZTabBarViewController

-(NSArray *)viewControllerArray{
    if (!_viewControllerArray) {
        _viewControllerArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"RZZTabBarViewController" ofType:@"plist"]];
    }
    return _viewControllerArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //通过appearance统一设置所有的UITabBarItem属性
    //方法或者属性后面带有UI_APPEARANCE_SELECTOR的，都可以通过appearance来设置
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f], NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10.0f], NSForegroundColorAttributeName:[UIColor colorWithRed:57.0/255.0 green:167.0/255.0 blue:241.0/255.0 alpha:1]} forState:UIControlStateSelected];
    
    for (NSDictionary *dic in self.viewControllerArray) {
        Class view = NSClassFromString(dic[@"viewController"]);
        UIViewController *viewController = [[view alloc] init];
        viewController.tabBarItem.image = [UIImage imageNamed:dic[@"image"]];
        viewController.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"selectImage"]];
        viewController.title = dic[@"title"];
        RZZNavigationController *nav = [[RZZNavigationController alloc] initWithRootViewController:viewController];
        [self addChildViewController:nav];
    };
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
