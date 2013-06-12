//
//  PTMetricImperialConversions.h
//  Personal Library for Metric <=> Imperial conversions
//
//  Created by Richard Holland on 07/06/2013.
//  Copyright (c) 2013 Richard Holland. All rights reserved.
//
//  Used to convert between metric and imperial as needed.
//

#import <Foundation/Foundation.h>

@interface PTMetricImperialConversions : NSObject

// Functions to convert between metric and imperial

+(NSNumber *)convertCMtoIN:(NSNumber *)value;
+(NSNumber *)convertINtoCM:(NSNumber *)value;
+(NSNumber *)convertKGtoLB:(NSNumber *)value;
+(NSNumber *)convertLBtoKG:(NSNumber *)value;
+(NSNumber *)convertStonesAndPoundsStringtoLB:(NSString *)value;
+(NSString *)convertLBtoStonesAndPoundsString:(NSNumber *)value;
+(NSNumber *)convertKgStringtoKg:(NSString *)value;
+(NSString *)convertKgtoKgString:(NSNumber *)value;
+(NSNumber *)convertInchesStringtoInches:(NSString *)value;
+(NSString *)convertInchestoInchesString:(NSNumber *)value;
+(NSNumber *)convertCmStringtoCm:(NSString *)value;
+(NSString *)convertCmtoCmString:(NSNumber *)value;

@end
