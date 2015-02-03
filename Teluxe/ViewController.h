//
//  ViewController.h
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionsViewController.h"
#import "ResultsViewController.h"
#import "LaunchViewController.h"
#import "TestingViewController.h"
#import "Model.h"

@interface ViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (Model*) model;
- (UIViewController *)viewControllerAtIndex:(NSUInteger) index;

@end