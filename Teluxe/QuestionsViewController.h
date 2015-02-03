//
//  QuestionsViewController.h
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface QuestionsViewController : UIViewController
{
    Model* model;
}

@property NSUInteger pageIndex;

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UIButton *choice1;
@property (weak, nonatomic) IBOutlet UIButton *choice2;
@property (weak, nonatomic) IBOutlet UIButton *choice3;
@property (weak, nonatomic) IBOutlet UIButton *choice4;
@property (weak, nonatomic) IBOutlet UIButton *choice5;

- (void) updateWithModel: (Model*) m;

@end

