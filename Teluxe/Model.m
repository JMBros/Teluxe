//
//  Model.m
//  Teluxe
//
//  Created by Justin Chiang on 12/10/14.
//  Copyright (c) 2014 Justin Chiang. All rights reserved.
//

#import "Model.h"

@implementation Model

- (void) setDistance:(NSUInteger)d {
    distance = d;
}

- (NSUInteger) getDistance {
    return distance;
}

- (void) setActivity:(NSString *)a {
    activity = a;
}

- (NSString*) getActivity {
    return activity;
}

- (void) setLux:(NSUInteger)l {
    lux = l;
}

- (NSUInteger) getLux {
    return lux;
}

- (int) getPercentileWithLux:(int)l andActivity: (NSString*)a {
    SCORE_COEFFICIENT = - 0.000006;
    int LUX_RECOMMENDED = [self getRecommendedLuxWithActivity: a];
    int lux_change = abs(l - LUX_RECOMMENDED);
    return 1200 * pow(M_E, SCORE_COEFFICIENT * pow(lux_change, 2));
}

- (int) getEfficacyWithBulb: (NSString*)bulb {
    int efficacy = 0;
    if ([bulb isEqual: @"fluorescent"])
        efficacy = 43;
    else if ([bulb isEqual: @"incandescent"])
        efficacy = 12;
    else if ([bulb isEqual: @"LED"])
        efficacy = 79;
    return efficacy;
}

- (int) getCurrentWattsWithLux: (int)l andBulb: (NSString*)bulb andDistance: (int)d {
    return [self getCurrentLumensWithLux:l andDistance:d] / [self getEfficacyWithBulb:bulb];
}

- (int) getCurrentLumensWithLux: (int)l andDistance: (int)d {
    REFLECTION_COEFFICIENT_1 = 0.48;
    return l * d * d * REFLECTION_COEFFICIENT_1;
}

- (int) getCurrentLuxWithLumens: (double)l {
    REFLECTION_COEFFICIENT_3 = 1110;
    return l * REFLECTION_COEFFICIENT_3;
}

- (NSString*) getCommentWithLux: (int)l andActivity: (NSString*)a {
    int LUX_RECOMMENDED = [self getRecommendedLuxWithActivity: a];
    int lux_change = abs(l - LUX_RECOMMENDED);
    
    if(lux_change < 75)
        return @"Perfect! You have an ideal amount of light.";
    else if (l < LUX_RECOMMENDED)
        return [NSString stringWithFormat:@"You do not have enough light.  You are %d lux below the recommended amount.", lux_change];
    return [NSString stringWithFormat:@"You are wasting energy!!!  You are %d lux above the recommended amount.", lux_change];
}

- (int) getRecommendedLuxWithActivity: (NSString*)a {
    if ([a  isEqual: @"sleep"])            // Dark Surroundings
        return 25;
    else if ([a isEqual: @"read"])        // Normal Reading/Drawing
        return 1000;
    else if ([a isEqual: @"computer"])    // Normal Office Work
        return 500;
    else if ([a isEqual: @"lounging"])      // Casual Work
        return 250;
    else if ([a isEqual: @"tv"])          // Theaters
        return 150;
    return 0;
}

- (int) getRecommendedLumensWithActivity: (NSString*)a andDistance: (int)d {
    REFLECTION_COEFFICIENT_2 = 0.09;
    int recommendedLux = [self getRecommendedLuxWithActivity:a];
    return recommendedLux * d * d * REFLECTION_COEFFICIENT_2;
}

- (int) getRecommendedWattsWithActivity: (NSString*)a {
    if ([a isEqual: @"sleep"])            // 100W for Wake-Up Lights
        return 100;
    else if ([a isEqual: @"read"])        // Between 40W - 60W
        return 50;
    else if ([a isEqual: @"computer"])    // No more than 60W
        return 60;
    else if ([a isEqual: @"lounge"])      // Ambient Light Bulbs
        return 12;
    else if ([a isEqual: @"tv"])          // No more than 60W
        return 60;
    return 0;
}

- (NSString*) getRecommendedTemperatureWithAcitvity: (NSString*)a {
    //    var SOFT_WHITE = 2800;   // Between 2700K and 3000K
    //    var COOL = 3800;         // Between 3500K and 4100K
    //    var DAYLIGHT = 5800;     // Between 5000K and 6500K
    
    if ([a  isEqual: @"sleep"])
        return @"SOFT WHITE";
    else if ([a  isEqual: @"read"])
        return @"DAYLIGHT";
    else if ([a  isEqual: @"computer"])
        return @"COOL";
    else if ([a  isEqual: @"lounging"])
        return @"SOFT WHITE";
    else if ([a  isEqual: @"tv"])
        return @"COOL";
    return 0;
}

@end