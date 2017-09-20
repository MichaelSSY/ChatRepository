//
//  AppDelegate.m
//  HuanXinTesk
//
//  Created by weiyun on 2017/7/3.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import <HyphenateLite/HyphenateLite.h>

#define EaseMobAppKey    @"oldkids#oldkids" //环信

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //AppKey:注册的AppKey，详细见下面注释。
    //EM_DEPRECATED_IOS 3.2.3
    EMOptions * options = [EMOptions optionsWithAppkey:EaseMobAppKey];
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    NSString * username = @"20170703";
    NSString * password = @"20170703";
    EMError * error1 = [[EMClient sharedClient] registerWithUsername:username password:password];
    if (error1==nil) {
        NSLog(@"注册成功");
        EMError * error2 = [[EMClient sharedClient] loginWithUsername:username password:password];
        if (!error2) {
            NSLog(@"登录成功");
            FirstViewController * vc = [[FirstViewController alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            self.window.rootViewController = nav;
        }else{
            NSLog(@"error2:%@",error2.errorDescription);
        }
    }else{
        //用户已存在
        NSLog(@"error1:%@",error1.errorDescription);

        EMError * error2 = [[EMClient sharedClient] loginWithUsername:username password:password];
        if (!error2) {
            NSLog(@"登录成功");
            FirstViewController * vc = [[FirstViewController alloc]init];
            UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
            self.window.rootViewController = nav;
        }else{
            NSLog(@"error2:%@",error2.errorDescription);
        }
    }
    
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
