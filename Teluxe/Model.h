//
//  Model.h
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
{
    NSUInteger distance;
    NSString* activity;
    NSUInteger lux;
    double SCORE_COEFFICIENT;
    double REFLECTION_COEFFICIENT_1;
    double REFLECTION_COEFFICIENT_2;
    double REFLECTION_COEFFICIENT_3;
}

- (void) setDistance:(NSUInteger)d;
- (NSUInteger) getDistance;
- (void) setActivity:(NSString *)a;
- (NSString*) getActivity;
- (void) setLux:(NSUInteger)l;
- (NSUInteger) getLux;

- (int) getPercentileWithLux:(int)l andActivity: (NSString*)a;
- (int) getEfficacyWithBulb: (NSString*)bulb;
- (int) getCurrentWattsWithLux: (int)l andBulb: (NSString*)bulb andDistance: (int)d;
- (int) getCurrentLumensWithLux: (int)l andDistance: (int)d;
- (int) getCurrentLuxWithLumens: (double)l;
- (NSString*) getCommentWithLux: (int)l andActivity: (NSString*)a;

- (int) getRecommendedLuxWithActivity: (NSString*)a;
- (int) getRecommendedLumensWithActivity: (NSString*)a andDistance: (int)d;
- (int) getRecommendedWattsWithActivity: (NSString*)a;
- (NSString*) getRecommendedTemperatureWithAcitvity: (NSString*)a;

@end