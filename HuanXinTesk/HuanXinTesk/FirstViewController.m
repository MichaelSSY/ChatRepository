//
//  FirstViewController.m
//  HuanXinTesk
//
//  Created by weiyun on 2017/7/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "FirstViewController.h"
#import "ChatViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 返回按钮的颜色
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    // self.title字体的颜色和大小
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:20]};

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.center = self.view.center;
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setTitle:@"聊天" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //更换群主
    //EMError * error = nil;
    //[[EMClient sharedClient].groupManager updateGroupOwner:@"groupId" newOwner:@"newOwner" error:&error];
}

- (void)buttonClick{
    
    NSString * username = @"20170703";
    
    ChatViewController * viewController = [[ChatViewController alloc] initWithConversationChatter:username conversationType:EMConversationTypeChat];
    viewController.title = @"20170703";
    [self.navigationController pushViewController:viewController animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
