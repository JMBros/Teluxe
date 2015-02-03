//
//  QuestionsViewController.m
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import "QuestionsViewController.h"

@interface QuestionsViewController ()

@end

@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonClick:(UIButton*)sender {
    // Change background color of button
    self.choice1.backgroundColor = UIColor.clearColor;
    self.choice2.backgroundColor = UIColor.clearColor;
    self.choice3.backgroundColor = UIColor.clearColor;
    self.choice4.backgroundColor = UIColor.clearColor;
    self.choice5.backgroundColor = UIColor.clearColor;
    sender.backgroundColor = UIColor.whiteColor;
    
    if ([sender.titleLabel.text  isEqual: @"Less than 1 foot"])
        [model setDistance:1];
    else if ([sender.titleLabel.text  isEqual: @"1 to 3 feet"])
        [model setDistance:2];
    else if ([sender.titleLabel.text  isEqual: @"3 to 5 feet"])
        [model setDistance:4];
    else if ([sender.titleLabel.text  isEqual: @"5 to 10 feet"])
        [model setDistance:7];
    else if ([sender.titleLabel.text  isEqual: @"More than 10 feet"])
        [model setDistance:15];
    
    if ([sender.titleLabel.text isEqual: @"Sleeping"])
        [model setActivity:@"sleep"];
    else if ([sender.titleLabel.text  isEqual: @"Reading"])
        [model setActivity:@"read"];
    else if ([sender.titleLabel.text  isEqual: @"Working on the Computer"])
        [model setActivity:@"computer"];
    else if ([sender.titleLabel.text  isEqual: @"Lounging"])
        [model setActivity:@"lounging"];
    else if ([sender.titleLabel.text  isEqual: @"Watching TV"])
        [model setActivity:@"tv"];
}

- (void) updateWithModel:(Model *)m {
    model = m;
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
