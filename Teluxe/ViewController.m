//
//  ViewController.m
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) Model *model;

@end

@implementation ViewController

@synthesize model = _model;

- (Model*) model
{
    if(!_model){
        _model = [[Model alloc] init];
    }
    return _model;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    UIViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = self.view.bounds;
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger) index
{
    if (index == 0)
    {
        LaunchViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LaunchScreen"];
        pageContentViewController.pageIndex = index;
        return pageContentViewController;
    }
    if (index == 1)
    {
        QuestionsViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"DistanceQuestionsScreen"];
        pageContentViewController.pageIndex = index;
        [pageContentViewController updateWithModel: self.model];
        return pageContentViewController;
    }
    if (index == 2)
    {
        QuestionsViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ActivityQuestionsScreen"];
        pageContentViewController.pageIndex = index;
        [pageContentViewController updateWithModel: self.model];
        return pageContentViewController;
    }
    if (index == 3)
    {
        TestingViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TestScreen"];
        pageContentViewController.pageIndex = index;
        [pageContentViewController updateWithModel: self.model];
        return pageContentViewController;
    }
    if (index == 4)
    {
        ResultsViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultsScreen"];
        pageContentViewController.pageIndex = index;
        [pageContentViewController updateWithModel: self.model];
        NSLog(@"Current distance is %lu, and current activity is %@", (unsigned long)[self.model getDistance], [self.model getActivity]);
        return pageContentViewController;
    }
    
    return nil;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((LaunchViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((LaunchViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index > 4) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
