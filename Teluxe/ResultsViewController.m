//
//  ResultsViewController.m
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import "ResultsViewController.h"

@interface ResultsViewController ()

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated{
    NSString* activity = [model getActivity];
    int distance = (int) [model getDistance];
    int lux = (int) [model getLux];
    
    score = [model getPercentileWithLux:lux andActivity:activity];
    recommendedLux = [model getRecommendedLuxWithActivity: activity];
    recommendedLumens = [model getRecommendedLumensWithActivity:activity andDistance:distance];
    recommendedTemperature = [model getRecommendedTemperatureWithAcitvity:activity];
    
    self.resultScore.text = [NSString stringWithFormat:@"%d", score];
    self.resultMessage.text = [model getCommentWithLux:[model getLux] andActivity:[model getActivity]];
    self.resultType.text = @"LED";
    self.resultLumens.text = [NSString stringWithFormat:@"%d", recommendedLumens];
    self.resultTemperature.text = recommendedTemperature;
    
    //change color of score
    if (score <= 300)
        self.resultScore.textColor = UIColor.redColor;
    else if (score <= 800)
        self.resultScore.textColor = UIColor.orangeColor;
    else
        self.resultScore.textColor = UIColor.greenColor;
    
    NSLog(@"score is %d", score);
    NSLog(@"current lux is %d", lux);
    NSLog(@"recommended lux is %d", recommendedLux);
    NSLog(@"recommended lumens is %d", recommendedLumens);
    NSLog(@"recommended temperature is %@", recommendedTemperature);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
