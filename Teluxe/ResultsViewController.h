//
//  ResultsViewController.h
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface ResultsViewController : UIViewController
{
    Model* model;
    int score;
    int recommendedLux;
    int recommendedLumens;
    NSString* recommendedTemperature;
}

@property NSUInteger pageIndex;
@property (weak, nonatomic) IBOutlet UILabel *resultScore;
@property (weak, nonatomic) IBOutlet UILabel *resultMessage;
@property (weak, nonatomic) IBOutlet UILabel *resultType;
@property (weak, nonatomic) IBOutlet UILabel *resultLumens;
@property (weak, nonatomic) IBOutlet UILabel *resultTemperature;

- (void) updateWithModel: (Model*) m;

@end
