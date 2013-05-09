//
//  AppDelegate.h
//  GoogleWeatherDemo
//
//  Created by Rohit Dhiman on 7/5/13.
//  Copyright (c) 2013 anchanto. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic) UINavigationController *navigationController;

@end
