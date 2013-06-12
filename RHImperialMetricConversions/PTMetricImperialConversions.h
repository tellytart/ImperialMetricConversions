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

// Converts Centimetres to Inches. Expects an NSNumber and returns an NSNumber to 3 decimal places.
+(NSNumber *)convertCMtoIN:(NSNumber *)value;

// Converts Inches to Centimeters. Expects and NSNumber and returns an NSNumber to 3 decimal places.
+(NSNumber *)convertINtoCM:(NSNumber *)value;

// Converts kilogrammes to UK pounds. Expects an NSNumber and returns an NSNumber to 3 decimal places.
+(NSNumber *)convertKGtoLB:(NSNumber *)value;

// Converts UK pounds to kilogrammes. Expects and NSNumber and returns an NSNumber to 3 decimal places.
+(NSNumber *)convertLBtoKG:(NSNumber *)value;

// Expects an NSString in the format "12st 13lb" and returns an NSNumber as the weight in UK pounds, to 3 decimal places.
+(NSNumber *)convertStonesAndPoundsStringtoLB:(NSString *)value;

// Expects an NSNumber of UK pounds, and converts it to a string in stones and pounds, formatted "12st 12lb"
+(NSString *)convertLBtoStonesAndPoundsString:(NSNumber *)value;

// Expects an NSString in the format "100.0kg" and returns an NSNumber of kilogrammes to 1 decimal place.
+(NSNumber *)convertKgStringtoKg:(NSString *)value;

// Expects an NSNumber of kilogrammes and returns an NSString "0.0kg" to 1 decimal place
+(NSString *)convertKgtoKgString:(NSNumber *)value;

// Expects an NSString of inches in the format 1 1/8" and returns the inches value as an NSNumber (will work with any value, e.g. 1/16 1/4 etc.)
+(NSNumber *)convertInchesStringtoInches:(NSString *)value;

// Expects an NSNumber of inches and returns a string 1 1/8". It will intelligently convert 2/8, 4/8 and 6/8 to 1/4, 1/2 and 3/4 respectively.
+(NSString *)convertInchestoInchesString:(NSNumber *)value;

// Expects an NSString formatted "0.0cm" and returns an NSNumber contining the number, to 1 decimal place.
+(NSNumber *)convertCmStringtoCm:(NSString *)value;

// Expects an NSNumber containing the number of centimetres, and returns a string in the format "0.0cm"
+(NSString *)convertCmtoCmString:(NSNumber *)value;

@end
