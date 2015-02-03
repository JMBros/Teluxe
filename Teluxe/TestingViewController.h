//
//  TestingViewController.h
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import <CoreVideo/CoreVideo.h>
#import <CoreMedia/CoreMedia.h>
#import <AVFoundation/AVFoundation.h>

@interface TestingViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    Model* model;
    NSUInteger totalLuxValues;
    int counter;
}

// Camera
@property (weak, nonatomic) IBOutlet UIImageView* cameraImageView;
@property (strong, nonatomic) AVCaptureDevice* device;
@property (strong, nonatomic) AVCaptureSession* captureSession;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer* previewLayer;
@property (strong, nonatomic) UIImage* cameraImage;

@property NSUInteger pageIndex;
@property double calculatedLux;
@property (weak, nonatomic) IBOutlet UIButton *startTest;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (void) updateWithModel: (Model*) m;

@end
